import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/remote_client_exception.dart';
import '../../../../../core/mixins/easy_loading_mixin.dart';
import '../../../domain/usecases/sent_reset_password_email.dart';

part 'retrieve_account_event.dart';
part 'retrieve_account_state.dart';

class RetrieveAccountBloc
    extends Bloc<RetrieveAccountEvent, RetrieveAccountState>
    with EasyLoadingMixin {
  static RetrieveAccountBloc get(context) => BlocProvider.of(context);
  final SendResetPasswordEmail _sendResetPasswordEmailUseCase;

  RetrieveAccountBloc(this._sendResetPasswordEmailUseCase)
      : super(const RetrieveAccountDefault()) {
    on<RetrieveAccountEvent>((event, emit) async {
      if (event is RetrieveAccountRequestEvent) {
        _handleRetrieveAccountEvent(event, emit);
      }
    });
  }

  void _handleRetrieveAccountEvent(RetrieveAccountRequestEvent event,
      Emitter<RetrieveAccountState> emit) async {
    try {
      showLoading();

      await _sendResetPasswordEmailUseCase.call(
        SendResetPasswordEmailParams(
          event.email,
        ),
      );

      dismiss();

      showToast(
        'E-mail enviado, verifique sua caixa de entrada',
        type: ToastType.success,
      );
    } on RemoteClientException catch (error) {
      dismiss();
      showToast(
        error.message,
        type: ToastType.error,
      );
    } catch (error) {
      emit(const RetrieveAccountError('Um erro inesperado aconteceu'));
    }
  }
}
