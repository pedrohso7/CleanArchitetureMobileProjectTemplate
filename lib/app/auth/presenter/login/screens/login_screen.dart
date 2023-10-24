import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/constants/routes/routes.dart';
import '../../../../../core/constants/theme/colors.dart';
import '../../../../../core/constants/theme/sizes.dart';
import '../../../../../core/constants/theme/text_style.dart';
import '../../../../../core/extensions/sized_box_extension.dart';
import '../../../../../core/mixins/validators_mixin.dart';
import '../../../../../core/widgets/default_button.dart';
import '../widgets/animated_background.dart';
import '../widgets/login_password_textinput.dart';
import '../widgets/login_textinput.dart';

class LoginScreen extends StatelessWidget {
  final bool startBackgroundAnimation;
  final bool startFormAnimation;
  final VoidCallback onPressRegisterButton;
  final VoidCallback onPressRetrieveAccountButton;
  final VoidCallback onPressLoginButton;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey formKey;

  const LoginScreen({
    Key? key,
    required this.startBackgroundAnimation,
    required this.startFormAnimation,
    required this.onPressLoginButton,
    required this.onPressRegisterButton,
    required this.onPressRetrieveAccountButton,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mq = MediaQuery.of(context);

    return SingleChildScrollView(
      child: Stack(
        children: [
          AnimatedBackground(
            startAnimation: startBackgroundAnimation,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppSizes.s16,
              horizontal: AppSizes.s24,
            ),
            child: AnimatedScale(
              curve: Curves.elasticOut,
              scale: startFormAnimation ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 1500),
              child: SizedBox(
                height: mq.size.height + AppSizes.s200,
                width: mq.size.width,
                child: Column(
                  children: [
                    VerticalSpace.s224,
                    LoginScreenForm(
                      formKey: formKey,
                      onPressLoginButton: onPressLoginButton,
                      emailController: emailController,
                      passwordController: passwordController,
                    ),
                    ButtonsSection(
                      onPressRegisterButton: onPressRegisterButton,
                      onPressRetrieveAccountButton:
                          onPressRetrieveAccountButton,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginScreenForm extends StatelessWidget with ValidatorsMixin {
  final VoidCallback onPressLoginButton;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey formKey;

  const LoginScreenForm({
    Key? key,
    required this.onPressLoginButton,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mq = MediaQuery.of(context);

    return Container(
      width: mq.size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: AppSizes.s24,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.s24,
        vertical: AppSizes.s16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.s32),
      ),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            const Text(
              'Login',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: AppFontSizes.s36,
                fontWeight: FontWeight.bold,
              ),
            ),
            VerticalSpace.s40,
            LoginTextInput(
              controller: emailController,
              label: 'Email',
              validator: (value) => emailValidator(value ?? ''),
            ),
            VerticalSpace.s24,
            LoginPasswordTextInput(
              controller: passwordController,
              validator: (value) => requiredValidator(value ?? ''),
            ),
            VerticalSpace.s32,
            DefaultButton(
              // fontSize: 16,
              borderRadius: AppSizes.s32,
              label: 'Entrar',
              onPressed: onPressLoginButton,
              width: mq.size.width,
            ),
            TextButton(
              onPressed: () =>
                  Modular.to.pushNamed(AppRoutesPaths.retriveAccountPath),
              child: Text(
                'Esqueceu a senha?',
                style: TextStyle(
                  color: AppColors.primaryColor.withOpacity(0.75),
                  fontSize: AppFontSizes.s16,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
                textScaleFactor: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonsSection extends StatelessWidget with ValidatorsMixin {
  final VoidCallback onPressRegisterButton;
  final VoidCallback onPressRetrieveAccountButton;

  const ButtonsSection({
    Key? key,
    required this.onPressRegisterButton,
    required this.onPressRetrieveAccountButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Divider(
                thickness: AppSizes.s2,
                indent: AppSizes.s16,
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                'Ainda não é cadastrado?',
                textAlign: TextAlign.center,
                textScaleFactor: 1,
                style: TextStyle(
                  color: AppColors.grey,
                  fontSize: AppFontSizes.s14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
              child: Divider(
                thickness: AppSizes.s2,
                indent: AppSizes.s16,
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: () => Modular.to.pushNamed(AppRoutesPaths.registerPath),
          style: const ButtonStyle(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: const Text(
            'Cadastre-se aqui',
            textScaleFactor: 1,
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: AppFontSizes.s14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
