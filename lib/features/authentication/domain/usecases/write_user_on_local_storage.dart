import 'package:clean_architeture_project/core/errors/local_storage_exception.dart';
import 'package:clean_architeture_project/core/usecases/usecase.dart';
import 'package:clean_architeture_project/features/authentication/domain/repositories/auth_repository_interface.dart';
import 'package:dartz/dartz.dart';

class WriteUserOnLocalStorage implements UseCase<void, WUOLSParams> {
  final AuthRepositoryInterface authRepository;
  WriteUserOnLocalStorage(this.authRepository);

  @override
  Future<void> call(WUOLSParams params) async {
    final Either<LocalStorageException, void> response =
        authRepository.writeUserOnLocalStorage(user: params.user);

    if (response.isLeft()) {
      final LocalStorageException? exception =
          response.fold((l) => l, (r) => null);
      throw exception!;
    }
  }
}

class WUOLSParams {
  late final Map user;

  WUOLSParams({
    required Map user,
  });
}
