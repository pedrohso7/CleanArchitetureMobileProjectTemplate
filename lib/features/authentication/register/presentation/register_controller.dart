import 'package:answer_me_app/core/errors/remote_client_exception.dart';
import 'package:answer_me_app/core/mixins/loading_mixin.dart';
import 'package:answer_me_app/core/mixins/message_mixin.dart';
import 'package:answer_me_app/features/authentication/domain/usecases/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController with LoaderMixin, MessageMixin {
  //Tela de cadastro
  final ScrollController scrollController = ScrollController();
  final GlobalKey<FormState> registerGK = GlobalKey<FormState>();
  final TextEditingController nameEC = TextEditingController();
  final TextEditingController emailEC = TextEditingController();
  final TextEditingController passwordEC = TextEditingController();
  final TextEditingController passwordConfirmationEC = TextEditingController();
  final RxBool isPasswordVisible = false.obs;
  final RxBool isPasswordConfirmationVisible = false.obs;

  final Register _registerUsecase;

  RegisterController({required Register registerUsecase})
      : _registerUsecase = registerUsecase;

  @override
  void dispose() {
    super.dispose();
    nameEC.dispose();
    emailEC.dispose();
    passwordEC.dispose();
    passwordConfirmationEC.dispose();
  }

  Future<void> register() async {
    try {
      Get.focusScope?.unfocus();
      if (registerGK.currentState?.validate() ?? false) {
        loading.toggle();

        await _registerUsecase.execute(
          name: nameEC.text,
          email: emailEC.text,
          password: passwordEC.text,
        );

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

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  Future<void> onTapBack() async {
    await Future.delayed(const Duration(milliseconds: 300), () {
      Get.back();
    });
  }
}
