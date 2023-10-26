import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/constants/routes/routes.dart';
import '../../../../../core/errors/remote_client_exception.dart';
import '../../../../../core/mixins/easy_loading_mixin.dart';
import '../../../domain/entities/user.dart';
import '../../../domain/usecases/register.dart';
import '../../../domain/usecases/write_string_on_local_storage.dart';
import '../../../domain/usecases/write_user_on_local_storage.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState>
    with EasyLoadingMixin {
  static RegisterBloc get(context) => BlocProvider.of(context);

  final Register _registerUseCase;
  final WriteStringOnLocalStorage _writeStringOnLocalStorageUseCase;
  final WriteUserOnLocalStorage _writeUserOnLocalStorageUseCase;

  RegisterBloc(
    this._registerUseCase,
    this._writeStringOnLocalStorageUseCase,
    this._writeUserOnLocalStorageUseCase,
  ) : super(const RegisterDefault()) {
    on<RegisterEvent>((event, emit) async {
      if (event is RegisterRequestEvent) {
        _handleRegisterEvent(event, emit);
      }
    });
  }

  void _handleRegisterEvent(
      RegisterRequestEvent event, Emitter<RegisterState> emit) async {
    try {
      showLoading();

      final response = await _registerUseCase.call(
        RegisterParams(
          event.name,
          event.email,
          event.password,
        ),
      );

      await dismiss();

      _saveAuthData(response);

      Modular.to.navigate(AppRoutesPaths.homePath);
    } on RemoteClientException catch (error) {
      dismiss();
      showToast(
        error.message,
        type: ToastType.error,
      );
    } catch (error) {
      emit(const RegisterError('Um erro inesperado aconteceu'));
    }
  }

  void _saveAuthData(User user) {
    _writeStringOnLocalStorageUseCase.call(WSOLSParams(
      'token',
      user.token.idToken,
    ));

    final DateTime expiryTime = DateTime.now().add(
      Duration(
        seconds: int.parse(user.token.expiresIn),
      ),
    );

    _writeStringOnLocalStorageUseCase.call(WSOLSParams(
      'expiryDate',
      expiryTime.toIso8601String(),
    ));

    _writeUserOnLocalStorageUseCase.call(WUOLSParams(
      {
        'email': user.email,
        'userId': user.localId,
      },
    ));
  }
}
