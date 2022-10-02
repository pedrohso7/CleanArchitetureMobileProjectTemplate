import 'package:get/get.dart';

import '../entities/user.dart';

abstract class UserRepositoryInterface {
  Future<User> register({
    required String name,
    required String email,
    required String password,
  });
  Future<Response> login({
    required String email,
    required String password,
  });
  void writeUserOnLocalStorage(Map user);
  void writeTokenOnLocalStorage(String token);
}
