import 'package:clean_architeture_project/core/usecases/usecase.dart';
import 'package:get/get.dart';

import '../domain/usecases/write_token_on_local_storage.dart';
import '../domain/usecases/write_user_on_local_storage.dart';
import 'home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UseCase<void, WTOLSParams>>(
      () => WriteTokenOnLocalStorage(Get.find()),
    );

    Get.lazyPut<UseCase<void, WUOLSParams>>(
      () => WriteUserOnLocalStorage(Get.find()),
    );

    Get.lazyPut(
      () => HomeController(
        writeTokenOnLocalStorage: Get.find(),
        writeUserOnLocalStorage: Get.find(),
      ),
    );
  }
}
