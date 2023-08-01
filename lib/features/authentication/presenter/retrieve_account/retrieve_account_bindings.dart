import 'package:clean_architeture_project/core/usecases/usecase.dart';
import 'package:get/get.dart';
import '../../domain/usecases/sent_reset_password_email.dart';
import 'retrieve_account_controller.dart';

class RetrieveAccountBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UseCase<Future<void>, SendResetPasswordEmailParams>>(
      () => SendResetPasswordEmail(Get.find()),
    );

    Get.lazyPut(
      () => RetrieveAccountController(
        sendResetPasswordEmailUsecase: Get.find(),
      ),
    );
  }
}
