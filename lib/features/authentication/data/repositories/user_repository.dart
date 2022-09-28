import 'package:answer_me_app/core/rest_client/exceptions/rest_client_exception.dart';
import 'package:answer_me_app/core/rest_client/rest_client.dart';
import 'package:answer_me_app/features/authentication/domain/entities/user.dart';
import 'package:answer_me_app/features/authentication/domain/repositories/user_repository_interface.dart';
import 'package:get/get.dart';

class UserRepository implements UserRepositoryInterface {
  final RestClient restClient;

  UserRepository({required this.restClient});

  @override
  Future<User> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final result = await restClient.post(
      '/auth/register',
      {
        'name': name,
        'email': email,
        'password': password,
      },
    );

    if (result.hasError) {
      throw RestClientException(
        '${result.body['error']}',
        code: result.statusCode,
      );
    }

    return User('j0ke', 'email', 'password', '');
  }

  @override
  Future<Response> login({
    required String email,
    required String password,
  }) async {
    final Response result = await restClient.get(
      '/auth/login',
      query: {
        'email': email,
        'password': password,
      },
    );

    if (result.hasError) {
      throw RestClientException(
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
    final Response result = await restClient.get(
      '/auth/token',
      query: {
        'token': token,
        'userId': userId,
      },
    );

    if (result.hasError) {
      throw RestClientException(
        '${result.body['error']}',
        code: result.statusCode,
      );
    }

    return result.body;
  }
}
