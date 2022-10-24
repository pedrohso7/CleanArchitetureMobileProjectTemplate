import 'package:clean_architeture_project/core/errors/remote_client_exception.dart';
import 'package:clean_architeture_project/core/usecases/usecase.dart';
import 'package:clean_architeture_project/features/authentication/domain/repositories/auth_repository_interface.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class Register implements UseCase<Future<Response>, RegisterParams> {
  final AuthRepositoryInterface authRepository;
  Register(this.authRepository);

  @override
  Future<Response> call(RegisterParams params) async {
    final Either<RemoteClientException, Response> response =
        await authRepository.register(
      name: params.name,
      email: params.email,
      password: params.password,
    );

    if (response.isLeft()) {
      final RemoteClientException? exception =
          response.fold((l) => l, (r) => null);
      throw exception!;
    }

    final Response? responseValue = response.fold((l) => null, (r) => r);

    return responseValue!;
  }
}

class RegisterParams {
  final String name;
  final String email;
  final String password;

  RegisterParams(
    this.name,
    this.email,
    this.password,
  );
}
