import 'package:clean_architeture_project/core/errors/local_storage_exception.dart';
import 'package:clean_architeture_project/core/usecases/usecase.dart';
import 'package:clean_architeture_project/features/authentication/domain/repositories/auth_repository_interface.dart';
import 'package:dartz/dartz.dart';

class WriteTokenOnLocalStorage implements UseCase<void, WTOLSParams> {
  final AuthRepositoryInterface authRepository;
  WriteTokenOnLocalStorage(this.authRepository);

  @override
  Future<void> call(WTOLSParams params) async {
    final Either<LocalStorageException, void> response =
        authRepository.writeTokenOnLocalStorage(token: params.token);

    if (response.isLeft()) {
      final LocalStorageException? exception =
          response.fold((l) => l, (r) => null);
      throw exception!;
    }
  }
}

class WTOLSParams {
  final String token;

  WTOLSParams(
    this.token,
  );
}
