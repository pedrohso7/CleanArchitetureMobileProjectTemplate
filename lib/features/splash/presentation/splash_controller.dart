import 'dart:async';

import 'package:clean_architeture_project/core/mixins/loading_mixin.dart';
import 'package:clean_architeture_project/core/usecases/usecase.dart';
import 'package:clean_architeture_project/features/splash/domain/usecases/get_string_from_local_storage.dart';
import 'package:get/get.dart';

class SplashController extends GetxController with LoaderMixin {
  final UseCase<String, GSFLSParams> _getStringFromLocalStorage;

  SplashController({
    required UseCase<String, GSFLSParams> getStringFromLocalStorage,
  }) : _getStringFromLocalStorage = getStringFromLocalStorage;

  Future<void> handleFirstRedirect() async {
    try {
      if (await checkIsUserLogged()) {
        await Get.offNamed('/home');
        return;
      }
      await Get.offNamed('/auth/login');
    } catch (e) {
      await Get.offNamed('/auth/login');
    }
  }

  Future<bool> checkIsUserLogged() async {
    final String expiryDate = _getStringFromLocalStorage(
      GSFLSParams('expiryDate'),
    );

    if (DateTime.parse(expiryDate).isAfter(DateTime.now())) {
      return true;
    }

    return false;
  }
}
