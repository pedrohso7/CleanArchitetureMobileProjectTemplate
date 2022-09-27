import 'package:answer_me_app/features/authentication/domain/entities/user.dart';
import 'package:get/get.dart';

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

  Future<bool> isUserTokenValid({
    required String token,
  });
}
