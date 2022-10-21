import 'package:clean_architeture_project/core/errors/local_storage_exception.dart';
import 'package:clean_architeture_project/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

import '../repositories/splash_repository_interface.dart';

class GetTokenFromLocalStorage implements UseCase<String, NoParams> {
  final SplashRepositoryInterface splashRepository;
  GetTokenFromLocalStorage(this.splashRepository);

  @override
  String call(NoParams params) {
    final Either<LocalStorageException, String> token =
        splashRepository.getTokenFromLocalStorage();

    if (token.isLeft()) {
      final LocalStorageException? exception =
          token.fold((l) => l, (r) => null);
      throw exception!;
    }

    late final String? tokenValue = token.fold((l) => null, (r) => r);

    return tokenValue!;
  }
}
