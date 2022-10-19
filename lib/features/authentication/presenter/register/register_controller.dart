import 'package:answer_me_app/core/errors/remote_client_exception.dart';
import 'package:answer_me_app/core/mixins/loading_mixin.dart';
import 'package:answer_me_app/core/mixins/message_mixin.dart';
import 'package:answer_me_app/core/mixins/validators_mixin.dart';
import 'package:answer_me_app/core/usecases/usecase.dart';
import 'package:answer_me_app/features/authentication/domain/usecases/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/usecases/write_token_on_local_storage.dart';
import '../../domain/usecases/write_user_on_local_storage.dart';

class RegisterController extends GetxController
    with LoaderMixin, MessageMixin, ValidatorsMixin {
  //Tela de cadastro
  final ScrollController scrollController = ScrollController();
  final GlobalKey<FormState> registerGK = GlobalKey<FormState>();
  final TextEditingController nameEC = TextEditingController();
  final TextEditingController emailEC = TextEditingController();
  final TextEditingController passwordEC = TextEditingController();
  final TextEditingController passwordConfirmationEC = TextEditingController();
  final RxBool isPasswordVisible = false.obs;
  final RxBool isPasswordConfirmationVisible = false.obs;

  final UseCase _registerUsecase;
  final UseCase _writeTokenOnLocalStorage;
  final UseCase _writeUserOnLocalStorage;

  RegisterController({
    required UseCase registerUsecase,
    required UseCase writeTokenOnLocalStorage,
    required UseCase writeUserOnLocalStorage,
  })  : _registerUsecase = registerUsecase,
        _writeTokenOnLocalStorage = writeTokenOnLocalStorage,
        _writeUserOnLocalStorage = writeUserOnLocalStorage;

  @override
  void dispose() {
    super.dispose();
    nameEC.dispose();
    emailEC.dispose();
    passwordEC.dispose();
    passwordConfirmationEC.dispose();
  }

  Future<void> handleSubmitButtonEvent() async {
    try {
      Get.focusScope?.unfocus();
      if (registerGK.currentState?.validate() ?? false) {
        loading.toggle();
        await register();
        loading.toggle();
      }
      await Get.offAllNamed('/home');
    } on RemoteClientException catch (e) {
      loading.toggle();
      message(MessageModel(
        title: 'Erro',
        message: e.message,
        type: MessageType.error,
      ));
    }
  }

  Future<void> register() async {
    final Response response = await _registerUsecase.call(RegisterParams(
      name: nameEC.text,
      email: emailEC.text,
      password: passwordEC.text,
    ));

    _writeTokenOnLocalStorage.call(WTOLSParams(
      token: response.body['token'],
    ));

    _writeUserOnLocalStorage.call(WUOLSParams(
      user: response.body['usr'],
    ));
  }

  void handleNextFieldEvent(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  Future<void> handleTapBackEvent() async {
    await Future.delayed(const Duration(milliseconds: 300), () {
      Get.back();
    });
  }
}
