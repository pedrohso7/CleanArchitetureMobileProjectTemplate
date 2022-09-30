import 'package:answer_me_app/core/errors/rest_client_exception.dart';
import 'package:answer_me_app/features/authentication/data/models/user_model.dart';
import 'package:answer_me_app/features/authentication/data/datasources/rest_client.dart';
import 'package:answer_me_app/features/authentication/domain/entities/user.dart';
import 'package:answer_me_app/features/authentication/domain/repositories/user_repository_interface.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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

    return UserModel('j0ke', 'email', 'password', '');
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

  @override
  User? getUserFromLocalStorage() {
    final GetStorage storage = GetStorage();

    final Map? user = storage.read('user');

    if (user == null) return null;

    return UserModel.fromMap(user);
  }

  @override
  String? getTokenFromLocalStorage() {
    final GetStorage storage = GetStorage();

    final String? token = storage.read('token');

    return token;
  }

  @override
  void writeUserOnLocalStorage(Map user) {
    final GetStorage storage = GetStorage();
    storage.write('token', user);
  }

  @override
  void writeTokenOnLocalStorage(String token) {
    final GetStorage storage = GetStorage();
    storage.write('token', token);
  }
}
