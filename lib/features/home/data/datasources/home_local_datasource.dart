import 'package:clean_architeture_project/core/errors/local_storage_exception.dart';
import 'package:get_storage/get_storage.dart';

abstract class HomeLocalDataSourceInterface {
  void removeAuthCachedData();
}

class HomeLocalDataSource implements HomeLocalDataSourceInterface {
  final GetStorage getStorage;

  HomeLocalDataSource({required this.getStorage});

  @override
  void removeAuthCachedData() {
    try {
      getStorage.remove('user');
      getStorage.remove('token');
      getStorage.remove('expiryDate');
    } catch (e) {
      throw LocalStorageException(
          message: 'Erro ao registrar recurso em cache');
    }
  }
}
