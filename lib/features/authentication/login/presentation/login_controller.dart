import 'package:answer_me_app/features/authentication/domain/repositories/user_repository_interface.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
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

  //Tela de esqueci minha senha (modal)
  final GlobalKey<FormState> forgotMyPasswordGK = GlobalKey<FormState>();
  final TextEditingController phoneEC = TextEditingController();

  //Tela do código de confirmação (modal)
  final GlobalKey<FormState> codeGK = GlobalKey<FormState>();
  final TextEditingController firstDigitEC = TextEditingController();
  final TextEditingController secondDigitEC = TextEditingController();
  final TextEditingController thirdDigitEC = TextEditingController();
  final TextEditingController fourthDigitEC = TextEditingController();
  final FocusNode fourthDigitFN = FocusNode();
  final FocusNode secondDigitFN = FocusNode();
  final FocusNode thirdDigitFN = FocusNode();

  //Tela do alteração de senha (modal)
  final GlobalKey<FormState> changePasswordGK = GlobalKey<FormState>();
  final isNewPasswordVisible = false.obs;
  final isNewPasswordConfirmationVisible = false.obs;
  final TextEditingController newPasswordEC = TextEditingController();
  final TextEditingController newPasswordConfirmationEC =
      TextEditingController();

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
    phoneEC.dispose();
    firstDigitEC.dispose();
    secondDigitEC.dispose();
    thirdDigitEC.dispose();
    fourthDigitEC.dispose();

    secondDigitFN.dispose();
    thirdDigitFN.dispose();
    fourthDigitFN.dispose();
  }

  Future<void> login({required String email, required String password}) async {
    try {
      // loading.toggle();
      final userLogged =
          await _userRepository.login(email: email, password: password);

      // final storage = GetStorage();

      // storage.write(AuthConstants.USER_KEY, userLogged.toJson());
      // storage.write(AuthConstants.USER_ACCESS_TOKEN, userLogged.accesstoken);
      debugPrint(userLogged);
      // loading.toggle();
    } catch (e, s) {
      // } on UserNotFoundException catch (e, s) {
      // loading.toggle();

      // log('Usuário ou senha inválidos!', error: e, stackTrace: s);
      // message(MessageModel(
      //   title: 'Erro',
      //   message: 'Usuário ou senha inválidos!',
      //   type: MessageType.error,
      // ));
      // } catch (e, s) {
      // loading.toggle();

      // log('Erro ao realizar login.', error: e, stackTrace: s);
      // message(MessageModel(
      //   title: 'Erro',
      //   message: 'Erro ao realizar login!',
      //   type: MessageType.error,
      // ));
    }
  }

  Future<void> sendCode() async {
    // loading.toggle();
    await Future.delayed(const Duration(milliseconds: 2380), () {
      // loading.toggle();
    });

    if (pageController.hasClients) {
      pageController.animateToPage(
        2,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> verifyCode() async {
    // loading.toggle();
    await Future.delayed(const Duration(milliseconds: 2380), () {
      // loading.toggle();
    });
    if (pageController.hasClients) {
      pageController.animateToPage(
        3,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> redefinePassword() async {
    // loading.toggle();
    await Future.delayed(const Duration(milliseconds: 2380), () {
      // loading.toggle();
    });
    if (pageController.hasClients) {
      pageController.jumpTo(0);
      // pageController.animateToPage(
      //   0,
      //   duration: const Duration(milliseconds: 600),
      //   curve: Curves.easeInOut,
      // );
    }
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }
}
