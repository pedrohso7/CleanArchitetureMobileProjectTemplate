import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/constants/routes/routes.dart';
import '../../../../../core/errors/remote_client_exception.dart';
import '../../../../../core/mixins/easy_loading_mixin.dart';
import '../../../domain/entities/user.dart';
import '../../../domain/usecases/login.dart';
import '../../../domain/usecases/write_string_on_local_storage.dart';
import '../../../domain/usecases/write_user_on_local_storage.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> with EasyLoadingMixin {
  static LoginBloc get(context) => BlocProvider.of(context);
  final Login _loginUseCase;
  final WriteStringOnLocalStorage _writeStringOnLocalStorageUseCase;
  final WriteUserOnLocalStorage _writeUserOnLocalStorageUseCase;

  LoginBloc(
    this._loginUseCase,
    this._writeStringOnLocalStorageUseCase,
    this._writeUserOnLocalStorageUseCase,
  ) : super(const LoginDefault(false, false)) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginRequestEvent) {
        _handleLoginEvent(event, emit);
      }

      if (event is StartBackgroundAnimationEvent) {
        _handleStartBackgroundAnimationEvent(emit);
      }

      if (event is StartFormAnimationEvent) {
        _handleStartFormAnimationEvent(emit);
      }
    });
  }

  void _handleLoginEvent(
      LoginRequestEvent event, Emitter<LoginState> emit) async {
    try {
      showLoading();

      final response = await _loginUseCase.call(LoginParams(
        event.email,
        event.password,
      ));

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
      emit(const LoginError('Um erro inesperado aconteceu'));
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

  void _handleStartBackgroundAnimationEvent(Emitter<LoginState> emit) async {
    emit(const LoginDefault(
      true,
      false,
    ));
  }

  void _handleStartFormAnimationEvent(Emitter<LoginState> emit) async {
    emit(const LoginDefault(
      true,
      true,
    ));
  }
}
