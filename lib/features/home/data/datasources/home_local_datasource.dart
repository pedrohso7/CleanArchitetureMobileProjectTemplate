import 'package:clean_architeture_project/core/errors/local_storage_exception.dart';
import 'package:get_storage/get_storage.dart';

abstract class HomeLocalDataSourceInterface {
  void writeUserOnLocalStorage(Map user);
  void writeTokenOnLocalStorage(String token);
}

class HomeLocalDataSource implements HomeLocalDataSourceInterface {
  final GetStorage getStorage;

  HomeLocalDataSource({required this.getStorage});

  @override
  void writeUserOnLocalStorage(Map user) {
    try {
      getStorage.write('user', user);
    } catch (e) {
      throw LocalStorageException(
          message: 'Erro ao registrar recurso em cache');
    }
  }

  @override
  void writeTokenOnLocalStorage(String token) {
    try {
      getStorage.write('token', token);
    } catch (e) {
      throw LocalStorageException(
          message: 'Erro ao registrar recurso em cache');
    }
  }
}
