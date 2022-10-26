import 'package:clean_architeture_project/core/errors/local_storage_exception.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepositoryInterface {
  Either<LocalStorageException, void> removeAuthCachedData();
}
