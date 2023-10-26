import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../core/platform/firebase_client.dart';
import '../../domain/entities/user.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSourceInterface {
  Future<User> register({
    required String name,
    required String email,
    required String password,
  });
  Future<User> login({
    required String email,
    required String password,
  });
  Future<dynamic> sendResetPasswordEmail({
    required String email,
  });
}

class AuthRemoteDataSource implements AuthRemoteDataSourceInterface {
  final IFirebaseClient authClient;
  const AuthRemoteDataSource(this.authClient);

  @override
  Future<User> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final Response result = await authClient.dio.post(
      '/accounts:signUp',
      data: {
        'email': email,
        'password': password,
        'returnSecureToken': true,
      },
      queryParameters: {
        'key': dotenv.env['FIREBASE_WEB_KEY'],
      },
    );

    return UserModel.fromMap(result.data);
  }

  @override
  Future<User> login({
    required String email,
    required String password,
  }) async {
    final Response result = await authClient.dio.post(
      '/accounts:signInWithPassword',
      data: {
        'email': email,
        'password': password,
        'returnSecureToken': true,
      },
      queryParameters: {
        'key': dotenv.env['FIREBASE_WEB_KEY'],
      },
    );

    return UserModel.fromMap(result.data);
  }

  @override
  Future<Response> sendResetPasswordEmail({
    required String email,
  }) async {
    return await authClient.dio.post(
      '/accounts:sendOobCode',
      data: {
        'requestType': "PASSWORD_RESET",
        'email': email,
      },
      queryParameters: {
        'key': dotenv.env['FIREBASE_WEB_KEY'],
      },
    );
  }
}
