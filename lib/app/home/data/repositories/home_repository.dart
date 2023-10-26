import '../../../../core/errors/local_storage_exception.dart';
import '../../../../core/result/result.dart';
import '../../domain/protocols/home_protocols.dart';
import '../datasources/home_local_datasource.dart';

class HomeRepository implements HomeProtocols {
  final HomeLocalDataSourceInterface localDataSource;
  const HomeRepository(this.localDataSource);

  @override
  IResult<void> removeAuthCachedData() {
    try {
      return SuccessResult(localDataSource.removeAuthCachedData());
    } on LocalStorageException catch (e) {
      return ErrorResult(e);
    }
  }
}
