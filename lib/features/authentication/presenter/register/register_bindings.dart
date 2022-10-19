import 'package:get/get.dart';
import '../../domain/usecases/register.dart';
import '../../domain/usecases/write_token_on_local_storage.dart';
import '../../domain/usecases/write_user_on_local_storage.dart';
import 'register_controller.dart';

class RegisterBindings implements Bindings {
  @override
  void dependencies() {
    //Usecases and ViewController
    Get.lazyPut(
      () => Register(Get.find()),
    );

    Get.lazyPut(
      () => WriteTokenOnLocalStorage(Get.find()),
    );

    Get.lazyPut(
      () => WriteUserOnLocalStorage(Get.find()),
    );

    Get.lazyPut(
      () => RegisterController(
        registerUsecase: Get.find(),
        writeTokenOnLocalStorage: Get.find(),
        writeUserOnLocalStorage: Get.find(),
      ),
    );
  }
}
