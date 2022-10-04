import 'package:answer_me_app/core/errors/local_storage_exception.dart';
import 'package:answer_me_app/core/errors/remote_client_exception.dart';
import 'package:dartz/dartz.dart';

import '../entities/user.dart';
import '../repositories/splash_repository_interface.dart';

class IsUserLogged {
  final SplashRepositoryInterface splashRepository;
  IsUserLogged(this.splashRepository);

  Future<bool> execute() async {
    final Either<LocalStorageException, String> token =
        splashRepository.getTokenFromLocalStorage();

    if (token.isLeft()) {
      return false;
    }

    late final String? tokenValue = token.fold((l) => null, (r) => r);

    final Either<LocalStorageException, User> user =
        splashRepository.getUserFromLocalStorage();

    if (user.isLeft()) {
      return false;
    }

    final User? userValue = user.fold((l) => null, (r) => r);

    final Either<RemoteClientException, bool> isUserTokenValid =
        await splashRepository.isUserTokenValid(
      token: tokenValue!,
      userId: userValue!.id,
    );

    return isUserTokenValid.fold((l) => false, (r) => r);
  }
}
