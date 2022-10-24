import 'dart:async';

import 'package:clean_architeture_project/core/errors/local_storage_exception.dart';
import 'package:clean_architeture_project/core/errors/remote_client_exception.dart';
import 'package:clean_architeture_project/core/mixins/loading_mixin.dart';
import 'package:clean_architeture_project/core/usecases/usecase.dart';
import 'package:get/get.dart';

import '../domain/entities/user.dart';
import '../domain/usecases/is_user_logged.dart';

class SplashController extends GetxController with LoaderMixin {
  final UseCase<Future<bool>, IsUserLoggedParams> _isUserLogged;
  final UseCase<String, NoParams> _getTokenFromLocalStorage;
  final UseCase<User, NoParams> _getUserFromLocalStorage;

  SplashController({
    required UseCase<Future<bool>, IsUserLoggedParams> isUserLogged,
    required UseCase<String, NoParams> getTokenFromLocalStorage,
    required UseCase<User, NoParams> getUserFromLocalStorage,
  })  : _isUserLogged = isUserLogged,
        _getTokenFromLocalStorage = getTokenFromLocalStorage,
        _getUserFromLocalStorage = getUserFromLocalStorage;

  Future<void> handleFirstRedirect() async {
    try {
      if (await checkIsUserLogged()) {
        await Get.offNamed('/home');
        return;
      }
      await Get.offNamed('/auth/login');
    } on RemoteClientException {
      await Get.offNamed('/auth/login');
    } on LocalStorageException {
      await Get.offNamed('/auth/login');
    } on TimeoutException {
      await Get.offNamed('/auth/login');
    }
  }

  Future<bool> checkIsUserLogged() async {
    final String token = _getTokenFromLocalStorage(NoParams());

    final User user = _getUserFromLocalStorage(NoParams());

    if (await _isUserLogged.call(IsUserLoggedParams(token, user.id))) {
      return true;
    }
    return false;
  }
}
