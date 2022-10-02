import 'package:get_storage/get_storage.dart';

import '../models/user_model.dart';

abstract class SplashLocalDataSourceInterface {
  UserModel? getUserFromLocalStorage();
  String? getTokenFromLocalStorage();
  void writeUserOnLocalStorage(Map user);
  void writeTokenOnLocalStorage(String token);
}

class SplashLocalDataSource implements SplashLocalDataSourceInterface {
  final GetStorage getStorage;

  SplashLocalDataSource({required this.getStorage});

  @override
  UserModel? getUserFromLocalStorage() {
    final Map? user = getStorage.read('user');

    if (user == null) return null;

    return UserModel.fromMap(user);
  }

  @override
  String? getTokenFromLocalStorage() {
    final String? token = getStorage.read('token');

    if (token == null) return null;

    return token;
  }

  @override
  void writeUserOnLocalStorage(Map user) => getStorage.write('user', user);

  @override
  void writeTokenOnLocalStorage(String token) =>
      getStorage.write('token', token);
}
