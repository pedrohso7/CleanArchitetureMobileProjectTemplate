import 'package:clean_architeture_project/core/usecases/usecase.dart';
import 'package:get/get.dart';
import '../../domain/usecases/login.dart';
import '../../domain/usecases/write_string_on_local_storage.dart';
import '../../domain/usecases/write_user_on_local_storage.dart';
import './login_controller.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    //Usecases and ViewController
    Get.lazyPut<UseCase<Future<Response>, LoginParams>>(
      () => Login(Get.find()),
    );

    Get.lazyPut<UseCase<void, WSOLSParams>>(
      () => WriteStringOnLocalStorage(Get.find()),
    );

    Get.lazyPut<UseCase<void, WUOLSParams>>(
      () => WriteUserOnLocalStorage(Get.find()),
    );

    Get.lazyPut(
      () => LoginController(
        loginUsecase: Get.find(),
        writeStringOnLocalStorage: Get.find(),
        writeUserOnLocalStorage: Get.find(),
      ),
    );
  }
}
