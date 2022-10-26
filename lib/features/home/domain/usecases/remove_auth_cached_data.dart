import 'package:clean_architeture_project/core/errors/local_storage_exception.dart';
import 'package:clean_architeture_project/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

import '../repositories/home_repository_interface.dart';

class RemoveAuthCachedData implements UseCase<void, NoParams> {
  final HomeRepositoryInterface homeRepository;
  RemoveAuthCachedData(this.homeRepository);

  @override
  Future<void> call(NoParams params) async {
    final Either<LocalStorageException, void> response =
        homeRepository.removeAuthCachedData();

    if (response.isLeft()) {
      final LocalStorageException? exception =
          response.fold((l) => l, (r) => null);
      throw exception!;
    }
  }
}
