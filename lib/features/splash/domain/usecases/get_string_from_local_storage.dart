import 'package:clean_architeture_project/core/errors/local_storage_exception.dart';
import 'package:clean_architeture_project/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

import '../repositories/splash_repository_interface.dart';

class GetStringFromLocalStorage implements UseCase<String, GSFLSParams> {
  final SplashRepositoryInterface splashRepository;
  GetStringFromLocalStorage(this.splashRepository);

  @override
  String call(GSFLSParams params) {
    final Either<LocalStorageException, String> token =
        splashRepository.getStringFromLocalStorage(params.key);

    if (token.isLeft()) {
      final LocalStorageException? exception =
          token.fold((l) => l, (r) => null);
      throw exception!;
    }

    late final String? tokenValue = token.fold((l) => null, (r) => r);

    return tokenValue!;
  }
}

class GSFLSParams {
  final String key;
  GSFLSParams(this.key);
}
