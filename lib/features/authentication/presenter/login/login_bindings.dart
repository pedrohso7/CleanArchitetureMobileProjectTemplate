import 'package:get/get.dart';
import '../../domain/usecases/login.dart';
import '../../domain/usecases/write_token_on_local_storage.dart';
import '../../domain/usecases/write_user_on_local_storage.dart';
import './login_controller.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    //Usecases and ViewController
    Get.lazyPut(
      () => Login(Get.find()),
    );

    Get.lazyPut(
      () => WriteTokenOnLocalStorage(Get.find()),
    );

    Get.lazyPut(
      () => WriteUserOnLocalStorage(Get.find()),
    );

    Get.lazyPut(
      () => LoginController(
        loginUsecase: Get.find(),
        writeTokenOnLocalStorage: Get.find(),
        writeUserOnLocalStorage: Get.find(),
      ),
    );
  }
}
