import 'package:answer_me_app/core/errors/local_storage_exception.dart';
import 'package:answer_me_app/core/errors/remote_client_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository_interface.dart';
import '../datasources/auth_local_datasource.dart';
import '../datasources/auth_remote_datasource.dart';

class UserRepository implements UserRepositoryInterface {
  final AuthRemoteDataSourceInterface remoteDataSource;
  final AuthLocalDataSourceInterface localDataSource;

  UserRepository({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<RemoteClientException, User>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      return Right(await remoteDataSource.register(
        name: name,
        email: email,
        password: password,
      ));
    } on RemoteClientException catch (e) {
      return Left(RemoteClientException(e.message, code: e.code));
    }
  }

  @override
  Future<Either<RemoteClientException, Response>> login({
    required String email,
    required String password,
  }) async {
    try {
      return Right(await remoteDataSource.login(
        email: email,
        password: password,
      ));
    } on RemoteClientException catch (e) {
      return Left(RemoteClientException(e.message, code: e.code));
    }
  }

  @override
  Either<LocalStorageException, void> writeUserOnLocalStorage(Map user) {
    try {
      return Right(localDataSource.writeUserOnLocalStorage(user));
    } on LocalStorageException catch (e) {
      return Left(LocalStorageException(message: e.message));
    }
  }

  @override
  Either<LocalStorageException, void> writeTokenOnLocalStorage(String token) {
    try {
      return Right(localDataSource.writeTokenOnLocalStorage(token));
    } on LocalStorageException catch (e) {
      return Left(LocalStorageException(message: e.message));
    }
  }
}
