import 'package:clean_architeture_project/core/errors/remote_client_exception.dart';
import 'package:clean_architeture_project/core/platform/remote_client.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';

abstract class SplashRemoteDataSourceInterface {
  Future<UserModel> register({
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
    required String userId,
  });
}

class SplashRemoteDataSource implements SplashRemoteDataSourceInterface {
  final RemoteClient remoteClient;

  SplashRemoteDataSource({required this.remoteClient});

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

  @override
  Future<bool> isUserTokenValid({
    required String token,
    required String userId,
  }) async {
    final Response result = await remoteClient.get(
      '/auth/token',
      query: {
        'token': token,
        'userId': userId,
      },
    );

    if (result.hasError) {
      throw RemoteClientException(
        '${result.body['error']}',
        code: result.statusCode,
      );
    }

    return result.body;
  }
}
