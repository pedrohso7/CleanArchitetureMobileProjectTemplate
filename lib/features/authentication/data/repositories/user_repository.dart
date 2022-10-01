import 'package:get/get.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository_interface.dart';
import '../datasources/local_datasource.dart';
import '../datasources/remote_datasource.dart';

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
  void writeUserOnLocalStorage(Map user) =>
      localDataSource.writeUserOnLocalStorage(user);

  @override
  void writeTokenOnLocalStorage(String token) =>
      localDataSource.writeTokenOnLocalStorage(token);
}
