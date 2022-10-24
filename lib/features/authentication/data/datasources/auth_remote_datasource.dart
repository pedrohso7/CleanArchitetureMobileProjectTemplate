import 'package:clean_architeture_project/core/constants/firebase_auth_errors.dart';
import 'package:clean_architeture_project/core/errors/remote_client_exception.dart';
import 'package:clean_architeture_project/core/platform/remote_client.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

abstract class AuthRemoteDataSourceInterface {
  Future<Response> register({
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
  Future<Response> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final Response result = await remoteClient.post('/accounts:signUp', {
      'email': email,
      'password': password,
      'returnSecureToken': true,
    }, query: {
      'key': dotenv.env['FIREBASE_WEB_KEY'],
    });

    if (result.hasError) {
      throw RemoteClientException(
        '${AuthErrors.firebase_auth_errors[result.body['error']['message'].split(' ')[0]]}',
        code: result.statusCode,
      );
    }

    return result;
  }

  @override
  Future<Response> login({
    required String email,
    required String password,
  }) async {
    final Response result = await remoteClient.post(
      '/accounts:signInWithPassword',
      {
        'email': email,
        'password': password,
        'returnSecureToken': true,
      },
      query: {
        'key': dotenv.env['FIREBASE_WEB_KEY'],
      },
    );

    if (result.hasError) {
      throw RemoteClientException(
        '${AuthErrors.firebase_auth_errors[result.body['error']['message']]}',
        code: result.statusCode,
      );
    }

    return result;
  }
}
