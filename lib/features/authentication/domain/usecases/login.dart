import 'package:clean_architeture_project/core/errors/remote_client_exception.dart';
import 'package:clean_architeture_project/core/usecases/usecase.dart';
import 'package:clean_architeture_project/features/authentication/domain/repositories/auth_repository_interface.dart';
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
  final String email;
  final String password;

  LoginParams(
    this.email,
    this.password,
  );
}
