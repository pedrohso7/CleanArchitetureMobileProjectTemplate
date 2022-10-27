import 'package:clean_architeture_project/core/errors/local_storage_exception.dart';
import 'package:clean_architeture_project/core/errors/remote_client_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import '../../domain/repositories/auth_repository_interface.dart';
import '../datasources/auth_local_datasource.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepository implements AuthRepositoryInterface {
  final AuthRemoteDataSourceInterface remoteDataSource;
  final AuthLocalDataSourceInterface localDataSource;

  AuthRepository({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<RemoteClientException, Response>> register({
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
  Either<LocalStorageException, void> writeUserOnLocalStorage(
      {required Map user}) {
    try {
      return Right(localDataSource.writeUserOnLocalStorage(user));
    } on LocalStorageException catch (e) {
      return Left(LocalStorageException(message: e.message));
    }
  }

  @override
  Either<LocalStorageException, void> writeStringOnLocalStorage({
    required String key,
    required String value,
  }) {
    try {
      return Right(localDataSource.writeStringOnLocalStorage(key, value));
    } on LocalStorageException catch (e) {
      return Left(LocalStorageException(message: e.message));
    }
  }
}
