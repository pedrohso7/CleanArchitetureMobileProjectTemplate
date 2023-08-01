import 'package:clean_architeture_project/core/errors/remote_client_exception.dart';
import 'package:clean_architeture_project/core/mixins/loading_mixin.dart';
import 'package:clean_architeture_project/core/mixins/message_mixin.dart';
import 'package:clean_architeture_project/core/mixins/validators_mixin.dart';
import 'package:clean_architeture_project/core/usecases/usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/usecases/sent_reset_password_email.dart';

class RetrieveAccountController extends GetxController
    with LoaderMixin, MessageMixin, ValidatorsMixin {
  final ScrollController scrollController = ScrollController();
  final PageController pageController = PageController();
  final GlobalKey<FormState> retrieveAccountGK = GlobalKey<FormState>();
  final TextEditingController emailEC = TextEditingController();
  final RxBool isPasswordVisible = false.obs;
  final RxBool isPasswordConfirmationVisible = false.obs;

  final UseCase<Future<void>, SendResetPasswordEmailParams>
      _sendResetPasswordEmailUsecase;

  RetrieveAccountController({
    required UseCase<Future<void>, SendResetPasswordEmailParams>
        sendResetPasswordEmailUsecase,
  }) : _sendResetPasswordEmailUsecase = sendResetPasswordEmailUsecase;

  @override
  void dispose() {
    super.dispose();
    emailEC.dispose();
  }

  Future<void> handleRetrieveAccountEvent() async {
    try {
      Get.focusScope!.unfocus();
      if (retrieveAccountGK.currentState?.validate() ?? false) {
        loading.toggle();
        await _sendResetPasswordEmailUsecase
            .call(SendResetPasswordEmailParams(emailEC.text.trim()));
        loading.toggle();

        message(MessageModel(
          title: 'Sucesso',
          message: 'E-mail enviado para ${emailEC.text}',
          type: MessageType.success,
        ));

        await Future.delayed(
            const Duration(milliseconds: 5000), () => Get.back());
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
