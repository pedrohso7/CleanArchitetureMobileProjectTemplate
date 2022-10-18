import 'package:get/get.dart';
import '../../domain/usecases/register.dart';
import 'register_controller.dart';

class RegisterBindings implements Bindings {
  @override
  void dependencies() {
    //Usecases and ViewController
    Get.lazyPut(
      () => Register(Get.find()),
    );

    Get.lazyPut(
      () => RegisterController(
        registerUsecase: Get.find(),
      ),
    );
  }
}
