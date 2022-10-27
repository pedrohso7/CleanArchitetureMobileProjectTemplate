import 'package:clean_architeture_project/core/errors/local_storage_exception.dart';
import 'package:get_storage/get_storage.dart';

abstract class AuthLocalDataSourceInterface {
  void writeUserOnLocalStorage(Map user);
  void writeStringOnLocalStorage(String key, String value);
}

class AuthLocalDataSource implements AuthLocalDataSourceInterface {
  final GetStorage getStorage;

  AuthLocalDataSource({required this.getStorage});

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
  void writeStringOnLocalStorage(String key, String value) {
    try {
      getStorage.write(key, value);
    } catch (e) {
      throw LocalStorageException(
          message: 'Erro ao registrar recurso em cache');
    }
  }
}
