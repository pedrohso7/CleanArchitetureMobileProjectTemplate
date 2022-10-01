import '../entities/user.dart';

abstract class SplashRepositoryInterface {
  Future<bool> isUserTokenValid({
    required String token,
    required String userId,
  });
  User? getUserFromLocalStorage();
  String? getTokenFromLocalStorage();
}
