import 'package:answer_me_app/core/errors/local_storage_exception.dart';
import 'package:get_storage/get_storage.dart';

import '../models/user_model.dart';

abstract class SplashLocalDataSourceInterface {
  UserModel getUserFromLocalStorage();
  String getTokenFromLocalStorage();
}

class SplashLocalDataSource implements SplashLocalDataSourceInterface {
  final GetStorage getStorage;

  SplashLocalDataSource({required this.getStorage});

  @override
  UserModel getUserFromLocalStorage() {
    final Map? user = getStorage.read('user');

    if (user == null) {
      throw LocalStorageException(message: 'Erro ao buscar recurso em cache');
    }

    return UserModel.fromMap(user);
  }

  @override
  String getTokenFromLocalStorage() {
    final String? token = getStorage.read('token');

    if (token == null) {
      throw LocalStorageException(message: 'Erro ao buscar recurso em cache');
    }

    return token;
  }
}
