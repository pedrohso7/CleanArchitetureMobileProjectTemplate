import 'package:answer_me_app/core/errors/remote_client_exception.dart';
import 'package:answer_me_app/core/mixins/loading_mixin.dart';
import 'package:answer_me_app/core/mixins/message_mixin.dart';
import 'package:answer_me_app/core/mixins/validators_mixin.dart';
import 'package:answer_me_app/core/usecases/usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/usecases/login.dart';

class LoginController extends GetxController
    with LoaderMixin, MessageMixin, ValidatorsMixin {
  //Tela de login
  final RxBool showBlueBackground = false.obs;
  final RxBool showModalPage = false.obs;
  final ScrollController scrollController = ScrollController();
  final PageController pageController = PageController();

  //Tela de login (modal)
  final GlobalKey<FormState> loginGK = GlobalKey<FormState>();
  final TextEditingController emailEC = TextEditingController();
  final TextEditingController passwordEC = TextEditingController();
  final RxBool isPasswordVisible = false.obs;

  final UseCase _loginUsecase;

  LoginController({required UseCase loginUsecase})
      : _loginUsecase = loginUsecase;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(milliseconds: 2680), () {
      showModalPage.value = true;
    });

    Future.delayed(const Duration(milliseconds: 1500), () {
      showBlueBackground.value = true;
    });
  }

  @override
  void dispose() {
    super.dispose();
    emailEC.dispose();
    passwordEC.dispose();
  }

  Future<void> login() async {
    try {
      Get.focusScope?.unfocus();
      if (loginGK.currentState?.validate() ?? false) {
        loading.toggle();

        await _loginUsecase.call(Params(
          email: emailEC.text,
          password: passwordEC.text,
        ));

        loading.toggle();

        await Get.toNamed('/home');
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

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }
}
