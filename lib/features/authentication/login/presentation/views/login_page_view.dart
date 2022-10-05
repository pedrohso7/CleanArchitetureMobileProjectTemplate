import 'package:answer_me_app/core/widgets/default_button.dart';
import 'package:answer_me_app/core/widgets/default_text_input.dart';
import 'package:answer_me_app/features/authentication/login/presentation/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
              height: 380,
              width: mq.size.width,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              padding: const EdgeInsets.only(
                right: 40,
                left: 40,
                top: 25,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
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
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 33),
                    DefaultTextInput(
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      textCapitalization: TextCapitalization.none,
                      textInputAction: TextInputAction.next,
                      borderColor: Colors.transparent,
                      icon: const Icon(
                        MdiIcons.email,
                        color: Colors.grey,
                        size: 25,
                      ),
                      label: const Text(
                        'Email',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textScaleFactor: 1,
                      ),
                      controller: controller.emailEC,
                      validator: (val) => controller.emailValidator(val ?? ''),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 25),
                    Obx(() {
                      return DefaultTextInput(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        textCapitalization: TextCapitalization.none,
                        icon: const Icon(
                          MdiIcons.lock,
                          color: Colors.grey,
                          size: 25,
                        ),
                        label: const Text(
                          'Senha',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textScaleFactor: 1,
                        ),
                        controller: controller.passwordEC,
                        validator: (val) =>
                            controller.requiredValidator(val ?? ''),
                        suffixWidget: IconButton(
                          splashColor: Colors.transparent,
                          onPressed: () => controller.isPasswordVisible.value =
                              !controller.isPasswordVisible.value,
                          icon: controller.isPasswordVisible.value
                              ? const Icon(
                                  MdiIcons.eye,
                                  color: Colors.grey,
                                  size: 25,
                                )
                              : const Icon(
                                  MdiIcons.eyeOff,
                                  color: Colors.grey,
                                  size: 25,
                                ),
                        ),
                        obscureText: !(controller.isPasswordVisible.value),
                      );
                    }),
                    const SizedBox(height: 35),
                    DefaultButton(
                      fontSize: 16,
                      borderRadius: 32,
                      label: 'Entrar',
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        if (controller.loginGK.currentState?.validate() ??
                            false) {
                          controller.login(
                            email: controller.emailEC.text,
                            password: controller.passwordEC.text,
                          );
                        }
                      },
                      width: mq.size.width,
                    ),
                    const SizedBox(height: 15),
                    TextButton(
                      onPressed: () => {
                        if (controller.pageController.hasClients)
                          {
                            controller.pageController.animateToPage(
                              1,
                              duration: const Duration(milliseconds: 600),
                              curve: Curves.easeInOut,
                            ),
                          }
                      },
                      child: Text(
                        'Esqueceu sua senha?',
                        style: TextStyle(
                          color: context.theme.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textScaleFactor: 1,
                      ),
                    ),
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
