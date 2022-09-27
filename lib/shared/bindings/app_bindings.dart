import 'package:answer_me_app/core/rest_client/rest_client.dart';
import 'package:get/get.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    // ! Bindings usados em todo app
    Get.lazyPut(() => RestClient(), fenix: true);
  }
}
