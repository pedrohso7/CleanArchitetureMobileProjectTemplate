import 'package:clean_architeture_project/core/errors/local_storage_exception.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repositories/home_repository_interface.dart';
import '../datasources/home_local_datasource.dart';

class HomeRepository implements HomeRepositoryInterface {
  final HomeLocalDataSourceInterface localDataSource;

  HomeRepository({
    required this.localDataSource,
  });

  @override
  Either<LocalStorageException, void> removeAuthCachedData() {
    try {
      return Right(localDataSource.removeAuthCachedData());
    } on LocalStorageException catch (e) {
      return Left(LocalStorageException(message: e.message));
    }
  }
}
