import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../core/errors/local_storage_exception.dart';

abstract class HomeLocalDataSourceInterface {
  void removeAuthCachedData();
}

class HomeLocalDataSource implements HomeLocalDataSourceInterface {
  final GetStorage getStorage = Modular.get<GetStorage>();

  @override
  void removeAuthCachedData() {
    try {
      getStorage.remove('user');
      getStorage.remove('token');
      getStorage.remove('expiryDate');
    } catch (e) {
      throw LocalStorageException(
          message: 'Erro ao remover recurso de autenticação');
    }
  }
}
