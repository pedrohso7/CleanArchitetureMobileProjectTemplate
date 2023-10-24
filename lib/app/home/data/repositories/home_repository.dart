import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/errors/local_storage_exception.dart';
import '../../../../core/result/result.dart';
import '../../domain/protocols/home_protocols.dart';
import '../datasources/home_local_datasource.dart';

class HomeRepository implements HomeProtocols {
  final HomeLocalDataSourceInterface localDataSource =
      Modular.get<HomeLocalDataSourceInterface>();

  @override
  IResult<void> removeAuthCachedData() {
    try {
      return SuccessResult(localDataSource.removeAuthCachedData());
    } on LocalStorageException catch (e) {
      return ErrorResult(e);
    }
  }
}
