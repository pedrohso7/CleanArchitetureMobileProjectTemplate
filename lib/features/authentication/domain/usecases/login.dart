import 'package:answer_me_app/features/authentication/domain/repositories/user_repository_interface.dart';
import 'package:get/get.dart';

class Login {
  final UserRepositoryInterface userRepository;
  Login(this.userRepository);

  Future<Response> execute({
    required String email,
    required String password,
  }) async {
    final Response response =
        await userRepository.login(email: email, password: password);

    userRepository.writeTokenOnLocalStorage(response.body['token']);
    userRepository.writeUserOnLocalStorage(response.body['usr']);

    return response;
  }
}
