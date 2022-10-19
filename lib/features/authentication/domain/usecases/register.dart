import 'package:answer_me_app/core/errors/remote_client_exception.dart';
import 'package:answer_me_app/core/usecases/usecase.dart';
import 'package:answer_me_app/features/authentication/domain/repositories/auth_repository_interface.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class Register implements UseCase<Response, Params> {
  final AuthRepositoryInterface authRepository;
  Register(this.authRepository);

  @override
  Future<Response> call(Params params) async {
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

class Params {
  late final String name;
  late final String email;
  late final String password;

  Params({
    required String name,
    required String email,
    required String password,
  });
}
