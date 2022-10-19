import 'package:answer_me_app/core/errors/local_storage_exception.dart';
import 'package:answer_me_app/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

import '../entities/user.dart';
import '../repositories/splash_repository_interface.dart';

class GetUserFromLocalStorage implements UseCase<User, NoParams> {
  final SplashRepositoryInterface splashRepository;
  GetUserFromLocalStorage(this.splashRepository);

  @override
  User call(NoParams params) {
    final Either<LocalStorageException, User> user =
        splashRepository.getUserFromLocalStorage();

    if (user.isLeft()) {
      final LocalStorageException? exception = user.fold((l) => l, (r) => null);
      throw exception!;
    }

    final User? userValue = user.fold((l) => null, (r) => r);

    return userValue!;
  }
}
