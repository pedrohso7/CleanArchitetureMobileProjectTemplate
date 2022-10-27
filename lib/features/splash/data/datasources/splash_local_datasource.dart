import 'package:clean_architeture_project/core/errors/local_storage_exception.dart';
import 'package:get_storage/get_storage.dart';

abstract class SplashLocalDataSourceInterface {
  String getStringFromLocalStorage(String key);
}

class SplashLocalDataSource implements SplashLocalDataSourceInterface {
  final GetStorage getStorage;

  SplashLocalDataSource({required this.getStorage});

  @override
  String getStringFromLocalStorage(String key) {
    final String? value = getStorage.read(key);

    if (value == null) {
      throw LocalStorageException(message: 'Erro ao buscar recurso em cache');
    }

    return value;
  }
}
