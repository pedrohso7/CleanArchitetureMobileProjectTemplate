import 'package:answer_me_app/core/mixins/loading_mixin.dart';
import 'package:answer_me_app/core/usecases/usecase.dart';
import 'package:get/get.dart';

class SplashController extends GetxController with LoaderMixin {
  final UseCase _isUserLoggedUsecase;

  SplashController({required UseCase isUserLoggedUsecase})
      : _isUserLoggedUsecase = isUserLoggedUsecase;

  Future<void> redirect() async {
    if (await _isUserLoggedUsecase.call(NoParams())) {
      await Get.offNamed('/home');
      return;
    }
    await Get.offNamed('/auth/login');
  }

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 2), () async => await redirect());
  }
}
