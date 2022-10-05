import 'package:answer_me_app/core/errors/remote_client_exception.dart';
import 'package:answer_me_app/features/authentication/domain/entities/user.dart';
import 'package:answer_me_app/features/authentication/domain/repositories/user_repository_interface.dart';
import 'package:dartz/dartz.dart';

class Register {
  final UserRepositoryInterface userRepository;
  Register(this.userRepository);

  Future<Either<RemoteClientException, User>> execute({
    required String name,
    required String email,
    required String password,
  }) async {
    final Either<RemoteClientException, User> response =
        await userRepository.register(
      name: name,
      email: email,
      password: password,
    );

    if (response.isLeft()) {
      final RemoteClientException? exception =
          response.fold((l) => l, (r) => null);
      throw exception!;
    }

    return response;
  }
}
