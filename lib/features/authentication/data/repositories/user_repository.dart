import 'package:answer_me_app/core/rest_client/exceptions/rest_client_exception.dart';
import 'package:answer_me_app/features/authentication/domain/repositories/user_repository_interface.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/user.dart';

class UserRepository implements UserRepositoryInterface {
  final dynamic restClient;

  UserRepository({this.restClient});

  @override
  Future<User> register({
    required String name,
    required String email,
    required String password,
  }) async {
    // UserModel userModel = UserModel.fromJson(
    //   GetStorage().read(AuthConstants.USER_KEY),
    // );

    final result = await restClient.post(
      '/auth/register',
      {
        'name': name,
        'email': email,
        'password': password,
      },
      // headers: {'Authorization': 'Bearer ' + userModel.accesstoken},
    );

    if (result.hasError) {
      debugPrint('Erro ao criar notificação (${result.statusCode})');

      throw RestClientException('Erro ao criar notificação');
    }

    return User('j0ke', 'email', 'password');
  }

  @override
  Future<dynamic> login({
    required String email,
    required String password,
  }) async {
    // UserModel userModel = UserModel.fromJson(
    //   GetStorage().read(AuthConstants.USER_KEY),
    // );

    final result = await restClient.post(
      '/auth/login',
      {
        'email': email,
        'password': password,
      },
      // headers: {'Authorization': 'Bearer ' + userModel.accesstoken},
    );

    if (result.hasError) {
      debugPrint('Erro ao criar notificação (${result.statusCode})');
      // debugPrint('Erro ao criar notificação (${result.statusCode})',
      //     error: result.statusText, stackTrace: StackTrace.current);

      throw RestClientException('Erro ao criar notificação');
    }
  }
}
