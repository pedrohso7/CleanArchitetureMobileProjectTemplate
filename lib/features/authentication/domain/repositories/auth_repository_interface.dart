import 'package:clean_architeture_project/core/errors/local_storage_exception.dart';
import 'package:clean_architeture_project/core/errors/remote_client_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

abstract class AuthRepositoryInterface {
  Future<Either<RemoteClientException, Response>> register({
    required String name,
    required String email,
    required String password,
  });
  Future<Either<RemoteClientException, Response>> login({
    required String email,
    required String password,
  });
  Either<LocalStorageException, void> writeUserOnLocalStorage(
      {required Map user});
  Either<LocalStorageException, void> writeTokenOnLocalStorage(
      {required String token});
}
