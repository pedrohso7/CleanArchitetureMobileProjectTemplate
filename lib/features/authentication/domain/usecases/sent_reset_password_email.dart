import 'package:clean_architeture_project/core/errors/remote_client_exception.dart';
import 'package:clean_architeture_project/core/usecases/usecase.dart';
import 'package:clean_architeture_project/features/authentication/domain/repositories/auth_repository_interface.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class SendResetPasswordEmail
    implements UseCase<Future<void>, SendResetPasswordEmailParams> {
  final AuthRepositoryInterface authRepository;
  SendResetPasswordEmail(this.authRepository);

  @override
  Future<void> call(SendResetPasswordEmailParams params) async {
    final Either<RemoteClientException, Response> response =
        await authRepository.sendResetPasswordEmail(
      email: params.email,
    );

    if (response.isLeft()) {
      final RemoteClientException? exception =
          response.fold((l) => l, (r) => null);
      throw exception!;
    }
  }
}

class SendResetPasswordEmailParams {
  final String email;

  SendResetPasswordEmailParams(
    this.email,
  );
}
