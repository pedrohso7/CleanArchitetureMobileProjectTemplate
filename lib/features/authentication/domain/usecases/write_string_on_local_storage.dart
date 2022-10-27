import 'package:clean_architeture_project/core/errors/local_storage_exception.dart';
import 'package:clean_architeture_project/core/usecases/usecase.dart';
import 'package:clean_architeture_project/features/authentication/domain/repositories/auth_repository_interface.dart';
import 'package:dartz/dartz.dart';

class WriteStringOnLocalStorage implements UseCase<void, WSOLSParams> {
  final AuthRepositoryInterface authRepository;
  WriteStringOnLocalStorage(this.authRepository);

  @override
  Future<void> call(WSOLSParams params) async {
    final Either<LocalStorageException, void> response =
        authRepository.writeStringOnLocalStorage(
      key: params.key,
      value: params.value,
    );

    if (response.isLeft()) {
      final LocalStorageException? exception =
          response.fold((l) => l, (r) => null);
      throw exception!;
    }
  }
}

class WSOLSParams {
  final String key;
  final String value;

  WSOLSParams(
    this.key,
    this.value,
  );
}
