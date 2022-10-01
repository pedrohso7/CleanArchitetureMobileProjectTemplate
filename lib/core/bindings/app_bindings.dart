import 'package:answer_me_app/core/platform/remote_client.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    // ! Bindings usados em todo app
    Get.lazyPut(() => RemoteClient(), fenix: true);
    Get.lazyPut(() => GetStorage(), fenix: true);
  }
}
