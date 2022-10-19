import 'package:answer_me_app/core/errors/remote_client_exception.dart';
import 'package:answer_me_app/core/usecases/usecase.dart';
import 'package:answer_me_app/features/authentication/domain/repositories/auth_repository_interface.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class Login implements UseCase<Future<Response>, LoginParams> {
  final AuthRepositoryInterface authRepository;
  Login(this.authRepository);

  @override
  Future<Response> call(LoginParams params) async {
    final Either<RemoteClientException, Response> response =
        await authRepository.login(
            email: params.email, password: params.password);

    if (response.isLeft()) {
      final RemoteClientException? exception =
          response.fold((l) => l, (r) => null);
      throw exception!;
    }

    final Response? responseValue = response.fold((l) => null, (r) => r);

    return responseValue!;
  }
}

class LoginParams {
  late final String email;
  late final String password;

  LoginParams({
    required String email,
    required String password,
  });
}
