import '../entities/user.dart';
import '../repositories/splash_repository_interface.dart';

class IsUserLogged {
  final SplashRepositoryInterface splashRepository;
  IsUserLogged(this.splashRepository);

  Future<bool> execute() async {
    final String? token = splashRepository.getTokenFromLocalStorage();
    final User? user = splashRepository.getUserFromLocalStorage();

    if (token == null || user == null) return false;

    final bool isUserTokenValid = await splashRepository.isUserTokenValid(
      token: token,
      userId: user.id,
    );

    return isUserTokenValid;
  }
}
