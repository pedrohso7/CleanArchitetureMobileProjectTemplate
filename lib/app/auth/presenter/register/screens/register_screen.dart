import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../core/constants/theme/colors.dart';
import '../../../../../core/constants/theme/sizes.dart';
import '../../../../../core/extensions/sized_box_extension.dart';
import '../../../../../core/mixins/validators_mixin.dart';
import '../../../../../core/widgets/default_back_page_widget.dart';
import '../../../../../core/widgets/default_button.dart';
import '../widgets/register_password_textinput.dart';
import '../widgets/register_textinput.dart';

class RegisterScreen extends StatelessWidget with ValidatorsMixin {
  const RegisterScreen({
    Key? key,
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.passwordConfirmationController,
    required this.onPressButton,
    required this.onPressBackButton,
  }) : super(key: key);

  final GlobalKey formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController passwordConfirmationController;
  final VoidCallback onPressBackButton;

  final VoidCallback onPressButton;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            DefaultBackPageWidget(title: '', onTap: onPressBackButton),
            VerticalSpace.s24,
            RegisterScreenForm(
              nameController: nameController,
              emailController: emailController,
              passwordController: passwordController,
              passwordConfirmationController: passwordConfirmationController,
              onPressButton: onPressButton,
              formKey: formKey,
            ),
            VerticalSpace.s32,
          ],
        ),
      ),
    );
  }
}

class RegisterScreenForm extends StatelessWidget with ValidatorsMixin {
  final VoidCallback onPressButton;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController passwordConfirmationController;
  final GlobalKey formKey;

  const RegisterScreenForm({
    Key? key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.passwordConfirmationController,
    required this.onPressButton,
    required this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mq = MediaQuery.of(context);

    return Form(
      key: formKey,
      child: Column(
        children: [
          VerticalSpace.s24,
          const Text(
            'Cadastro',
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: AppSizes.s40,
              fontWeight: FontWeight.bold,
            ),
          ),
          VerticalSpace.s32,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(thickness: 1),
          ),
          VerticalSpace.s32,
          RegisterTextInput(
            label: 'Nome',
            controller: nameController,
            validator: (val) => requiredValidator(val ?? ''),
            icon: MdiIcons.accountBox,
          ),
          VerticalSpace.s24,
          RegisterTextInput(
            label: 'Email',
            controller: emailController,
            validator: (val) => emailValidator(val ?? ''),
            keyboardType: TextInputType.emailAddress,
            icon: MdiIcons.email,
          ),
          VerticalSpace.s24,
          RegisterPasswordTextInput(
            controller: passwordController,
            validator: (val) => requiredValidator(val ?? ''),
          ),
          VerticalSpace.s24,
          RegisterPasswordTextInput(
            controller: passwordConfirmationController,
            label: 'Confirme sua senha',
            validator: (val) => passwordConfirmationValidator(
              val ?? '',
              passwordController.text,
            ),
          ),
          VerticalSpace.s32,
          DefaultButton(
            borderRadius: AppSizes.s32,
            label: 'CADASTRAR',
            onPressed: onPressButton,
            width: mq.size.width,
          ),
        ],
      ),
    );
  }
}
