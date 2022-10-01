import 'package:answer_me_app/core/errors/remote_client_exception.dart';
import 'package:answer_me_app/core/platform/remote_client.dart';
import 'package:answer_me_app/features/authentication/data/models/user_model.dart';
import 'package:answer_me_app/features/authentication/domain/entities/user.dart';
import 'package:get/get.dart';

abstract class RemoteDataSourceInterface {
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
    required String userId,
  });
}

class RemoteDataSource implements RemoteDataSourceInterface {
  final RemoteClient remoteClient;

  RemoteDataSource({required this.remoteClient});

  @override
  Future<User> register({
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
