import 'package:answer_me_app/core/errors/remote_client_exception.dart';
import 'package:answer_me_app/core/platform/remote_client.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';

abstract class AuthRemoteDataSourceInterface {
  Future<UserModel> register({
    required String name,
    required String email,
    required String password,
  });
  Future<Response> login({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSource implements AuthRemoteDataSourceInterface {
  final RemoteClient remoteClient;

  AuthRemoteDataSource({required this.remoteClient});

  @override
  Future<UserModel> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final result = await remoteClient.post(
      '/auth/register',
      {
        'name': name,
        'email': email,
        'password': password,
      },
    );

    if (result.hasError) {
      throw RemoteClientException(
        '${result.body['error']}',
        code: result.statusCode,
      );
    }

    return UserModel('j0ke', 'email', 'password', '');
  }

  @override
  Future<Response> login({
    required String email,
    required String password,
  }) async {
    final Response result = await remoteClient.get(
      '/auth/login',
      query: {
        'email': email,
        'password': password,
      },
    );

    if (result.hasError) {
      throw RemoteClientException(
        '${result.body['error']}',
        code: result.statusCode,
      );
    }

    return result;
  }
}
