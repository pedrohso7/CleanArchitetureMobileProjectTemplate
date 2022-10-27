import 'package:clean_architeture_project/core/errors/remote_client_exception.dart';
import 'package:clean_architeture_project/core/mixins/loading_mixin.dart';
import 'package:clean_architeture_project/core/mixins/message_mixin.dart';
import 'package:clean_architeture_project/core/mixins/validators_mixin.dart';
import 'package:clean_architeture_project/core/usecases/usecase.dart';
import 'package:clean_architeture_project/features/authentication/domain/usecases/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/usecases/write_string_on_local_storage.dart';
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

  final UseCase<Future<Response>, RegisterParams> _registerUsecase;
  final UseCase<void, WSOLSParams> _writeStringOnLocalStorage;
  final UseCase<void, WUOLSParams> _writeUserOnLocalStorage;

  RegisterController({
    required UseCase<Future<Response>, RegisterParams> registerUsecase,
    required UseCase<void, WSOLSParams> writeStringOnLocalStorage,
    required UseCase<void, WUOLSParams> writeUserOnLocalStorage,
  })  : _registerUsecase = registerUsecase,
        _writeStringOnLocalStorage = writeStringOnLocalStorage,
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

  Future<void> register() async {
    final Response response = await _registerUsecase.call(
      RegisterParams(
        nameEC.text,
        emailEC.text,
        passwordEC.text,
      ),
    );

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

  Future<void> handleTapBackEvent() async {
    await Future.delayed(const Duration(milliseconds: 300), () {
      Get.back();
    });
  }
}
