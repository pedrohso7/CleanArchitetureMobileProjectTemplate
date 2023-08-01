import 'package:clean_architeture_project/core/errors/remote_client_exception.dart';
import 'package:clean_architeture_project/core/platform/auth_client.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import '../../../../core/constants/firebase_auth_errors.dart';

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
  Future<Response> sendResetPasswordEmail({
    required String email,
  });
}

class AuthRemoteDataSource implements AuthRemoteDataSourceInterface {
  final AuthClient authClient;

  AuthRemoteDataSource({required this.authClient});

  @override
  Future<Response> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final Response result = await authClient.post('/accounts:signUp', {
      'email': email,
      'password': password,
      'returnSecureToken': true,
    }, query: {
      'key': dotenv.env['FIREBASE_WEB_KEY'],
    });

    if (result.hasError) {
      throw RemoteClientException(
        '${AuthErrors.firebaseAuthErrors[result.body['error']['message'].split(' ')[0]]}',
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
    final Response result = await authClient.post(
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
        '${AuthErrors.firebaseAuthErrors[result.body['error']['message']]}',
        code: result.statusCode,
      );
    }

    return result;
  }

  @override
  Future<Response> sendResetPasswordEmail({
    required String email,
  }) async {
    final Response result = await authClient.post(
      '/accounts:sendOobCode',
      {
        'requestType': "PASSWORD_RESET",
        'email': email,
      },
      query: {
        'key': dotenv.env['FIREBASE_WEB_KEY'],
      },
    );

    if (result.hasError) {
      throw RemoteClientException(
        '${AuthErrors.firebaseAuthErrors[result.body['error']['message']]}',
        code: result.statusCode,
      );
    }

    return result;
  }
}
