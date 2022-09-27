import 'package:answer_me_app/features/authentication/data/repositories/user_repository.dart';
import 'package:answer_me_app/features/authentication/domain/repositories/user_repository_interface.dart';
import 'package:get/get.dart';
import 'splash_controller.dart';

class SplashBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserRepositoryInterface>(
      () => UserRepository(restClient: Get.find()),
    );

    Get.lazyPut(
      () => SplashController(userRepository: Get.find()),
    );
  }
}
