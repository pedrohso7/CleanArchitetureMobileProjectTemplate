import 'package:clean_architeture_project/core/usecases/usecase.dart';
import 'package:get/get.dart';

import '../domain/usecases/write_token_on_local_storage.dart';
import '../domain/usecases/write_user_on_local_storage.dart';

class HomeController extends GetxController {
  final UseCase<void, WTOLSParams> _writeTokenOnLocalStorage;
  final UseCase<void, WUOLSParams> _writeUserOnLocalStorage;

  HomeController({
    required UseCase<void, WTOLSParams> writeTokenOnLocalStorage,
    required UseCase<void, WUOLSParams> writeUserOnLocalStorage,
  })  : _writeTokenOnLocalStorage = writeTokenOnLocalStorage,
        _writeUserOnLocalStorage = writeUserOnLocalStorage;

  void handleLogoutButtonAction() {
    _writeTokenOnLocalStorage.call(WTOLSParams(
      '',
    ));

    _writeUserOnLocalStorage.call(WUOLSParams(
      {},
    ));

    Get.offAllNamed('/auth/login');
  }
}
