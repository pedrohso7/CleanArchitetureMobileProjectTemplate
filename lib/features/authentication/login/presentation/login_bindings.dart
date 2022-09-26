import 'package:answer_me_app/features/authentication/data/repositories/user_repository.dart';
import 'package:answer_me_app/features/authentication/domain/repositories/user_repository_interface.dart';
import 'package:get/get.dart';
import './login_controller.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserRepositoryInterface>(
      () => UserRepository(restClient: Get.find()),
    );

    Get.lazyPut(
      () => LoginController(userRepository: Get.find()),
    );
  }
}
