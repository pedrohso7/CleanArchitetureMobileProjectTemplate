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

class RetrieveAccountController extends GetxController
    with LoaderMixin, MessageMixin, ValidatorsMixin {
  final ScrollController scrollController = ScrollController();
  final PageController pageController = PageController();
  final GlobalKey<FormState> retrieveAccountGK = GlobalKey<FormState>();
  final GlobalKey<FormState> codeConfirmationGK = GlobalKey<FormState>();
  final GlobalKey<FormState> resetPasswordGK = GlobalKey<FormState>();
  final TextEditingController emailEC = TextEditingController();
  final TextEditingController firstEC = TextEditingController();
  final TextEditingController secondEC = TextEditingController();
  final TextEditingController thirdEC = TextEditingController();
  final TextEditingController fourthEC = TextEditingController();
  final TextEditingController passwordEC = TextEditingController();
  final TextEditingController passwordConfirmationEC = TextEditingController();
  final RxBool isPasswordVisible = false.obs;
  final RxBool isPasswordConfirmationVisible = false.obs;
  final RxInt step = 0.obs;

  // final UseCase<Future<Response>, LoginParams> _loginUsecase;
  // final UseCase<void, WSOLSParams> _writeStringOnLocalStorage;
  // final UseCase<void, WUOLSParams> _writeUserOnLocalStorage;

  RetrieveAccountController(
      // required UseCase<Future<Response>, LoginParams> loginUsecase,
      // required UseCase<void, WSOLSParams> writeStringOnLocalStorage,
      // required UseCase<void, WUOLSParams> writeUserOnLocalStorage,
      );
  // : _loginUsecase = loginUsecase,
  //       _writeStringOnLocalStorage = writeStringOnLocalStorage,
  //       _writeUserOnLocalStorage = writeUserOnLocalStorage;

  @override
  void dispose() {
    super.dispose();
    emailEC.dispose();
    firstEC.dispose();
    secondEC.dispose();
    thirdEC.dispose();
    fourthEC.dispose();
    passwordEC.dispose();
    passwordConfirmationEC.dispose();
  }

  Future<void> handleRetrieveAccountEvent() async {
    try {
      Get.focusScope!.unfocus();
      if (retrieveAccountGK.currentState?.validate() ?? false) {
        loading.toggle();
        // controller.sendCode();
        print('TESTE');
        loading.toggle();
        pageController.animateToPage(
          1,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
        );
        step.value = 1;
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

  Future<void> handleCodeConfirmationEvent() async {
    try {
      Get.focusScope!.unfocus();
      if (codeConfirmationGK.currentState?.validate() ?? false) {
        loading.toggle();
        // controller.sendCode();
        print('TESTE');
        loading.toggle();
        pageController.animateToPage(
          2,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
        );
        step.value = 2;
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

  Future<void> handleResetPasswordEvent() async {
    try {
      Get.focusScope!.unfocus();
      if (codeConfirmationGK.currentState?.validate() ?? false) {
        loading.toggle();
        // controller.sendCode();
        print('TESTE');
        loading.toggle();
        // pageController.jumpTo(2);
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

  Future<void> handleTapBackEvent() async {
    await Future.delayed(const Duration(milliseconds: 300), () {
      Get.back();
    });
  }

  void handleNextFieldEvent(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }
}
