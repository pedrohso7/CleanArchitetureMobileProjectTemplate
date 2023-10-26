import 'package:dio/dio.dart';

import '../../../../core/result/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../protocols/auth_protocols.dart';

class SendResetPasswordEmail
    implements UseCase<Future<void>, SendResetPasswordEmailParams> {
  final AuthProtocols authRepository;
  const SendResetPasswordEmail(this.authRepository);

  @override
  Future<void> call(SendResetPasswordEmailParams params) async {
    final IResult<Response> response =
        await authRepository.sendResetPasswordEmail(
      email: params.email,
    );

    if (response.isError) {
      throw (response as ErrorResult).exception;
    }
  }
}

class SendResetPasswordEmailParams {
  final String email;

  SendResetPasswordEmailParams(
    this.email,
  );
}
