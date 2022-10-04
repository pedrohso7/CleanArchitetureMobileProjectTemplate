import 'package:answer_me_app/core/errors/local_storage_exception.dart';
import 'package:answer_me_app/core/errors/remote_client_exception.dart';
import 'package:dartz/dartz.dart';

import '../entities/user.dart';

abstract class SplashRepositoryInterface {
  Future<Either<RemoteClientException, bool>> isUserTokenValid({
    required String token,
    required String userId,
  });
  Either<LocalStorageException, User> getUserFromLocalStorage();
  Either<LocalStorageException, String> getTokenFromLocalStorage();
}
