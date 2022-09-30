import 'package:answer_me_app/core/mixins/loading_mixin.dart';
import 'package:answer_me_app/features/authentication/domain/usecases/is_user_logged.dart';
import 'package:get/get.dart';

class SplashController extends GetxController with LoaderMixin {
  final IsUserLogged _isUserLoggedUsecase;

  SplashController({required IsUserLogged isUserLoggedUsecase})
      : _isUserLoggedUsecase = isUserLoggedUsecase;

  void redirect() async {
    await Future.delayed(const Duration(seconds: 2), () async {
      if (await _isUserLoggedUsecase.execute()) {
        await Get.toNamed('/home');
        return;
      }
      await Get.toNamed('/auth/login');
    });
  }
}
