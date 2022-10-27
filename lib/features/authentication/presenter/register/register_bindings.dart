import 'package:clean_architeture_project/core/usecases/usecase.dart';
import 'package:get/get.dart';
import '../../domain/usecases/register.dart';
import '../../domain/usecases/write_string_on_local_storage.dart';
import '../../domain/usecases/write_user_on_local_storage.dart';
import 'register_controller.dart';

class RegisterBindings implements Bindings {
  @override
  void dependencies() {
    //Usecases and ViewController
    Get.lazyPut<UseCase<Future<Response>, RegisterParams>>(
      () => Register(Get.find()),
    );

    Get.lazyPut<UseCase<void, WSOLSParams>>(
      () => WriteStringOnLocalStorage(Get.find()),
    );

    Get.lazyPut<UseCase<void, WUOLSParams>>(
      () => WriteUserOnLocalStorage(Get.find()),
    );

    Get.lazyPut(
      () => RegisterController(
        registerUsecase: Get.find(),
        writeStringOnLocalStorage: Get.find(),
        writeUserOnLocalStorage: Get.find(),
      ),
    );
  }
}
