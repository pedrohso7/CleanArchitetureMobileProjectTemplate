import 'package:clean_architeture_project/core/usecases/usecase.dart';
import 'package:get/get.dart';
import '../../domain/usecases/login.dart';
import '../../domain/usecases/write_string_on_local_storage.dart';
import '../../domain/usecases/write_user_on_local_storage.dart';
import 'retrieve_account_controller.dart';

class RetrieveAccountBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => RetrieveAccountController(),
    );
  }
}
