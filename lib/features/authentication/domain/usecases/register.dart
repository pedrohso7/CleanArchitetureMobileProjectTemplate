import 'package:answer_me_app/features/authentication/domain/entities/user.dart';
import 'package:answer_me_app/features/authentication/domain/repositories/user_repository_interface.dart';

class Register {
  final UserRepositoryInterface userRepository;
  Register(this.userRepository);

  Future<User> execute({
    required String name,
    required String email,
    required String password,
  }) {
    return userRepository.register(
      name: name,
      email: email,
      password: password,
    );
  }
}
