import 'package:answer_me_app/core/rest_client/exceptions/rest_client_exception.dart';
import 'package:answer_me_app/features/authentication/domain/repositories/user_repository_interface.dart';
import 'package:answer_me_app/shared/mixins/loading_mixin.dart';
import 'package:answer_me_app/shared/mixins/message_mixin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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

  final UserRepositoryInterface _userRepository;

  LoginController({required UserRepositoryInterface userRepository})
      : _userRepository = userRepository;

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

      final Response response =
          await _userRepository.login(email: email, password: password);

      final GetStorage storage = GetStorage();
      storage.write('user', response.body['usr']);
      storage.write('token', response.body['token']);

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
