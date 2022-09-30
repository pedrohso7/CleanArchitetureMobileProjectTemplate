import 'package:answer_me_app/core/errors/rest_client_exception.dart';
import 'package:answer_me_app/core/mixins/loading_mixin.dart';
import 'package:answer_me_app/core/mixins/message_mixin.dart';
import 'package:answer_me_app/features/authentication/domain/usecases/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with LoaderMixin, MessageMixin {
  //Tela de login
  final showBlueBackground = false.obs;
  final showModalPage = false.obs;
  final ScrollController scrollController = ScrollController();
  final PageController pageController = PageController();

  //Tela de login (modal)
  final GlobalKey<FormState> loginGK = GlobalKey<FormState>();
  final TextEditingController emailEC = TextEditingController();
  final TextEditingController passwordEC = TextEditingController();
  final isPasswordVisible = false.obs;

  final Login _loginUsecase;

  LoginController({required Login loginUsecase}) : _loginUsecase = loginUsecase;

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

  Future<void> login({required String email, required String password}) async {
    try {
      loading.toggle();

      await _loginUsecase.execute(
        email: email,
        password: password,
      );

      loading.toggle();

      await Get.toNamed('/home');
    } on RestClientException catch (e, s) {
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
