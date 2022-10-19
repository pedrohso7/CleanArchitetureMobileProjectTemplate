import 'package:answer_me_app/core/errors/local_storage_exception.dart';
import 'package:answer_me_app/core/usecases/usecase.dart';
import 'package:answer_me_app/features/authentication/domain/repositories/auth_repository_interface.dart';
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
  late final String token;

  WTOLSParams({
    required String token,
  });
}
