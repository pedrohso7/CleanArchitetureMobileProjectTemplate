import 'package:answer_me_app/features/authentication/data/datasources/local_datasource.dart';
import 'package:answer_me_app/features/authentication/data/datasources/remote_datasource.dart';
import 'package:answer_me_app/features/authentication/domain/entities/user.dart';
import 'package:answer_me_app/features/authentication/domain/repositories/user_repository_interface.dart';
import 'package:get/get.dart';

class UserRepository implements UserRepositoryInterface {
  final RemoteDataSourceInterface remoteDataSource;
  final LocalDataSourceInterface localDataSource;

  UserRepository({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<User> register({
    required String name,
    required String email,
    required String password,
  }) async {
    return remoteDataSource.register(
      name: name,
      email: email,
      password: password,
    );
  }

  @override
  Future<Response> login({
    required String email,
    required String password,
  }) async {
    return remoteDataSource.login(
      email: email,
      password: password,
    );
  }

  @override
  Future<bool> isUserTokenValid({
    required String token,
    required String userId,
  }) async {
    return remoteDataSource.isUserTokenValid(
      token: token,
      userId: userId,
    );
  }

  @override
  User? getUserFromLocalStorage() {
    return localDataSource.getUserFromLocalStorage();
  }

  @override
  String? getTokenFromLocalStorage() {
    return localDataSource.getTokenFromLocalStorage();
  }

  @override
  void writeUserOnLocalStorage(Map user) =>
      localDataSource.writeUserOnLocalStorage(user);

  @override
  void writeTokenOnLocalStorage(String token) =>
      localDataSource.writeTokenOnLocalStorage(token);
}
