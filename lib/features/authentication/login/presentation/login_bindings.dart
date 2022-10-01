import 'package:answer_me_app/features/authentication/domain/usecases/login.dart';
import 'package:get/get.dart';
import './login_controller.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    //Usecases and ViewController
    Get.lazyPut(
      () => Login(Get.find()),
    );

    Get.lazyPut(
      () => LoginController(loginUsecase: Get.find()),
    );
  }
}
