import '../entities/user.dart';

abstract class UserRepositoryInterface {
  Future<User> register({
    required String name,
    required String email,
    required String password,
  });
  Future<dynamic> login({
    required String email,
    required String password,
  });
}
