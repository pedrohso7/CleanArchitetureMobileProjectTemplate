import 'package:answer_me_app/core/errors/local_storage_exception.dart';
import 'package:answer_me_app/core/errors/remote_client_exception.dart';
import 'package:answer_me_app/core/mixins/loading_mixin.dart';
import 'package:answer_me_app/core/usecases/usecase.dart';
import 'package:answer_me_app/features/splash/domain/usecases/is_user_logged.dart';
import 'package:get/get.dart';

import '../domain/entities/user.dart';

class SplashController extends GetxController with LoaderMixin {
  final UseCase _isUserLoggedUsecase;
  final UseCase _getTokenFromLocalStorage;
  final UseCase _getUserFromLocalStorage;

  SplashController({
    required UseCase isUserLoggedUsecase,
    required UseCase getTokenFromLocalStorage,
    required UseCase getUserFromLocalStorage,
  })  : _isUserLoggedUsecase = isUserLoggedUsecase,
        _getTokenFromLocalStorage = getTokenFromLocalStorage,
        _getUserFromLocalStorage = getUserFromLocalStorage;

  Future<void> handleFirstRedirect() async {
    try {
      if (await isUserLogged()) {
        await Get.offNamed('/home');
        return;
      }
      await Get.offNamed('/auth/login');
    } on RemoteClientException {
      await Get.offNamed('/auth/login');
    } on LocalStorageException {
      await Get.offNamed('/auth/login');
    }
  }

  Future<bool> isUserLogged() async {
    final String token = _getTokenFromLocalStorage(NoParams());

    final User user = _getUserFromLocalStorage(NoParams());

    if (await _isUserLoggedUsecase
        .call(IsUserLoggedParams(token: token, userId: user.id))) {
      return true;
    }
    return false;
  }

  @override
  void onInit() {
    super.onInit();
    Future.delayed(
        const Duration(seconds: 2), () async => await handleFirstRedirect());
  }
}
