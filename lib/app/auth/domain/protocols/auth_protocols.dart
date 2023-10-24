import 'package:dio/dio.dart';
import '../../../../core/result/result.dart';
import '../entities/user.dart';

abstract class AuthProtocols {
  Future<IResult<User>> register({
    required String name,
    required String email,
    required String password,
  });
  Future<IResult<User>> login({
    required String email,
    required String password,
  });
  Future<IResult<Response>> sendResetPasswordEmail({
    required String email,
  });
  IResult<void> writeUserOnLocalStorage({required Map user});
  IResult<void> writeStringOnLocalStorage(
      {required String key, required String value});
}
