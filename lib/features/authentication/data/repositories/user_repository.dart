import 'package:answer_me_app/core/rest_client/exceptions/rest_client_exception.dart';
import 'package:answer_me_app/core/rest_client/rest_client.dart';
import 'package:answer_me_app/features/authentication/data/models/user_model.dart';
import 'package:answer_me_app/features/authentication/domain/entities/user.dart';
import 'package:answer_me_app/features/authentication/domain/repositories/user_repository_interface.dart';

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
      throw RestClientException('${result.body['error']}',
          code: result.statusCode);
    }

    return User('j0ke', 'email', 'password', '');
  }

  @override
  Future<dynamic> login({
    required String email,
    required String password,
  }) async {
    final result = await restClient.get(
      '/auth/login',
      query: {
        'email': email,
        'password': password,
      },
    );

    if (result.hasError) {
      throw RestClientException('${result.body['error']}',
          code: result.statusCode);
    }

    return UserModel.fromMap(result.body);
  }
}
