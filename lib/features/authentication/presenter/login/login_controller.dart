import 'package:clean_architeture_project/core/errors/remote_client_exception.dart';
import 'package:clean_architeture_project/core/mixins/loading_mixin.dart';
import 'package:clean_architeture_project/core/mixins/message_mixin.dart';
import 'package:clean_architeture_project/core/mixins/validators_mixin.dart';
import 'package:clean_architeture_project/core/usecases/usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/usecases/login.dart';
import '../../domain/usecases/write_string_on_local_storage.dart';
import '../../domain/usecases/write_user_on_local_storage.dart';

class LoginController extends GetxController
    with LoaderMixin, MessageMixin, ValidatorsMixin {
  final RxBool showBlueBackground = false.obs;
  final RxBool showModalPage = false.obs;
  final ScrollController scrollController = ScrollController();
  final PageController pageController = PageController();
  final GlobalKey<FormState> loginGK = GlobalKey<FormState>();
  final TextEditingController emailEC = TextEditingController();
  final TextEditingController passwordEC = TextEditingController();
  final RxBool isPasswordVisible = false.obs;

  final UseCase<Future<Response>, LoginParams> _loginUsecase;
  final UseCase<void, WSOLSParams> _writeStringOnLocalStorage;
  final UseCase<void, WUOLSParams> _writeUserOnLocalStorage;

  LoginController({
    required UseCase<Future<Response>, LoginParams> loginUsecase,
    required UseCase<void, WSOLSParams> writeStringOnLocalStorage,
    required UseCase<void, WUOLSParams> writeUserOnLocalStorage,
  })  : _loginUsecase = loginUsecase,
        _writeStringOnLocalStorage = writeStringOnLocalStorage,
        _writeUserOnLocalStorage = writeUserOnLocalStorage;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(milliseconds: 2680), () {
      showModalPage.toggle();
    });

    Future.delayed(const Duration(milliseconds: 1500), () {
      showBlueBackground.toggle();
    });
  }

  @override
  void dispose() {
    super.dispose();
    emailEC.dispose();
    passwordEC.dispose();
  }

  Future<void> handleSubmitButtonEvent() async {
    try {
      Get.focusScope?.unfocus();
      if (loginGK.currentState?.validate() ?? false) {
        loading.toggle();
        await login();
        loading.toggle();
        await Get.offAllNamed('/home');
      }
    } on RemoteClientException catch (e) {
      loading.toggle();
      message(MessageModel(
        title: 'Erro',
        message: e.message,
        type: MessageType.error,
      ));
    }
  }

  Future<void> login() async {
    final Response response = await _loginUsecase.call(LoginParams(
      emailEC.text,
      passwordEC.text,
    ));

    cacheAuthData(response);
  }

  void cacheAuthData(Response response) {
    _writeStringOnLocalStorage.call(WSOLSParams(
      'token',
      response.body['idToken'],
    ));

    final DateTime expiryTime = DateTime.now().add(
      Duration(
        seconds: int.parse(response.body['expiresIn']),
      ),
    );

    _writeStringOnLocalStorage.call(WSOLSParams(
      'expiryDate',
      expiryTime.toIso8601String(),
    ));

    _writeUserOnLocalStorage.call(WUOLSParams(
      {
        'email': response.body['email'],
        'userId': response.body['localId'],
      },
    ));
  }

  void handleNextFieldEvent(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }
}
