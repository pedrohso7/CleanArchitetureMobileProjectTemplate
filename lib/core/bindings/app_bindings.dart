import 'package:clean_architeture_project/core/platform/auth_client.dart';
import 'package:clean_architeture_project/core/platform/remote_client.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    // Bindings from core
    Get.lazyPut<RemoteClient>(() => RemoteClient(), fenix: true);
    Get.lazyPut<AuthClient>(() => AuthClient(), fenix: true);
    Get.lazyPut<GetStorage>(() => GetStorage(), fenix: true);
  }
}
