import 'package:clean_architeture_project/core/errors/local_storage_exception.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repositories/splash_repository_interface.dart';
import '../datasources/splash_local_datasource.dart';

class SplashRepository implements SplashRepositoryInterface {
  final SplashLocalDataSourceInterface localDataSource;

  SplashRepository({
    required this.localDataSource,
  });

  @override
  Either<LocalStorageException, String> getStringFromLocalStorage(String key) {
    try {
      return Right(localDataSource.getStringFromLocalStorage(key));
    } on LocalStorageException catch (e) {
      return Left(e);
    }
  }
}
