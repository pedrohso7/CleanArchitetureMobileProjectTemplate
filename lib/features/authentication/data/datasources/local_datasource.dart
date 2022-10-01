import 'package:answer_me_app/features/authentication/data/models/user_model.dart';
import 'package:get_storage/get_storage.dart';

abstract class LocalDataSourceInterface {
  UserModel? getUserFromLocalStorage();
  String? getTokenFromLocalStorage();
  void writeUserOnLocalStorage(Map user);
  void writeTokenOnLocalStorage(String token);
}

class LocalDataSource implements LocalDataSourceInterface {
  final GetStorage getStorage;

  LocalDataSource({required this.getStorage});

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
