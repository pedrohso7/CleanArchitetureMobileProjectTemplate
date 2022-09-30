import 'package:answer_me_app/features/authentication/domain/entities/user.dart';
import 'package:answer_me_app/features/authentication/domain/repositories/user_repository_interface.dart';

class IsUserLogged {
  final UserRepositoryInterface userRepository;
  IsUserLogged(this.userRepository);

  Future<bool> execute() async {
    final String? token = userRepository.getTokenFromLocalStorage();
    final User? user = userRepository.getUserFromLocalStorage();

    if (token == null || user == null) return false;

    final bool isUserTokenValid = await userRepository.isUserTokenValid(
      token: token,
      userId: user.id,
    );

    return isUserTokenValid;
  }
}
