import 'package:answer_me_app/core/errors/local_storage_exception.dart';
import 'package:answer_me_app/core/errors/remote_client_exception.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/user.dart';
import '../../domain/repositories/splash_repository_interface.dart';
import '../datasources/splash_local_datasource.dart';
import '../datasources/splash_remote_datasource.dart';

class SplashRepository implements SplashRepositoryInterface {
  final SplashRemoteDataSourceInterface remoteDataSource;
  final SplashLocalDataSourceInterface localDataSource;

  SplashRepository({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<RemoteClientException, bool>> isUserTokenValid({
    required String token,
    required String userId,
  }) async {
    try {
      return Right(await remoteDataSource.isUserTokenValid(
        token: token,
        userId: userId,
      ));
    } on RemoteClientException catch (e) {
      return Left(e);
    }
  }

  @override
  Either<LocalStorageException, User> getUserFromLocalStorage() {
    try {
      return Right(localDataSource.getUserFromLocalStorage());
    } on LocalStorageException catch (e) {
      return Left(e);
    }
  }

  @override
  Either<LocalStorageException, String> getTokenFromLocalStorage() {
    try {
      return Right(localDataSource.getTokenFromLocalStorage());
    } on LocalStorageException catch (e) {
      return Left(e);
    }
  }
}
