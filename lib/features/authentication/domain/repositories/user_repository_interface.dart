import 'package:answer_me_app/core/errors/local_storage_exception.dart';
import 'package:answer_me_app/core/errors/remote_client_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

abstract class UserRepositoryInterface {
  Future<Either<RemoteClientException, Response>> register({
    required String name,
    required String email,
    required String password,
  });
  Future<Either<RemoteClientException, Response>> login({
    required String email,
    required String password,
  });
  Either<LocalStorageException, void> writeUserOnLocalStorage(Map user);
  Either<LocalStorageException, void> writeTokenOnLocalStorage(String token);
}
