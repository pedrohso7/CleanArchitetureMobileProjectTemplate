import 'package:answer_me_app/core/widgets/default_button.dart';
import 'package:answer_me_app/features/authentication/presenter/login/presentation/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/login_password_textinput.dart';
import '../widgets/login_textinput.dart';

class LoginPageView extends GetView<LoginController> {
  final bool startAnimation;
  const LoginPageView({Key? key, required this.startAnimation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mq = MediaQuery.of(context);

    return AnimatedScale(
      curve: Curves.elasticOut,
      scale: controller.showModalPage.value ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 1000),
      child: SizedBox(
        height: mq.size.height + 200,
        width: mq.size.width,
        child: Column(
          children: [
            const SizedBox(height: 220),
            Container(
              width: mq.size.width,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
              ),
              child: Form(
                key: controller.loginGK,
                child: Column(
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        color: context.theme.primaryColor,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 40),
                    LoginTextInput(
                      controller: controller.emailEC,
                      label: 'Email',
                    ),
                    const SizedBox(height: 25),
                    Obx(() {
                      return LoginPasswordTextInput(
                        onTapRightIcon: () => controller.isPasswordVisible
                            .value = !controller.isPasswordVisible.value,
                        controller: controller.passwordEC,
                        validator: (val) =>
                            controller.requiredValidator(val ?? ''),
                        isPasswordVisible: controller.isPasswordVisible.value,
                      );
                    }),
                    const SizedBox(height: 35),
                    DefaultButton(
                      fontSize: 16,
                      borderRadius: 32,
                      label: 'Entrar',
                      onPressed: () => controller.login(),
                      width: mq.size.width,
                    ),
                    const SizedBox(height: 15),
                    // TextButton(
                    //   onPressed: () => {
                    //     if (controller.pageController.hasClients)
                    //       {
                    //         controller.pageController.animateToPage(
                    //           1,
                    //           duration: const Duration(milliseconds: 600),
                    //           curve: Curves.easeInOut,
                    //         ),
                    //       }
                    //   },
                    //   child: Text(
                    //     'Esqueceu sua senha?',
                    //     style: TextStyle(
                    //       color: context.theme.primaryColor,
                    //       fontSize: 16,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //     textScaleFactor: 1,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 35),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        indent: 20,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Ainda não é cadastrado?',
                        textAlign: TextAlign.center,
                        textScaleFactor: 1,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        endIndent: 20,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () => Get.toNamed(
                    '/auth/register',
                  ),
                  style: const ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    'Cadastre-se aqui',
                    textScaleFactor: 1,
                    style: TextStyle(
                      color: context.theme.primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
