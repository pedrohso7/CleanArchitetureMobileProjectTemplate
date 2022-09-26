import 'package:answer_me_app/features/authentication/data/repositories/user_repository.dart';
import 'package:answer_me_app/features/authentication/login/presentation/login_controller.dart';
import 'package:get/get.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(userRepository: UserRepository()));

    // ! Bindings usados em todo app
    // Get.lazyPut(() => RestClient(remoteConfig: Get.find()), fenix: true);
    // Get.lazyPut(() => NotificationService(), fenix: true);
    // Get.lazyPut(() => FirebaseMessagingService(), fenix: true);
  }
}
