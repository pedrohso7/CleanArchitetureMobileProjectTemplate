import 'package:clean_architeture_project/core/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../retrieve_account_controller.dart';
import '../widgets/retrieve_account_password_textinput.dart';

class ChangePasswordPage extends GetView<RetrieveAccountController> {
  const ChangePasswordPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mq = MediaQuery.of(context);

    return Form(
      key: controller.resetPasswordGK,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Nova senha',
              style: TextStyle(
                color: context.theme.primaryColor,
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
              textScaleFactor: 1,
            ),
            const SizedBox(height: 33),
            Obx(() {
              return RetrieveAccountPasswordTextInput(
                label: 'Nova Senha',
                controller: controller.passwordEC,
                validator: (val) => controller.requiredValidator(val ?? ''),
                isPasswordVisible: controller.isPasswordVisible.value,
                onTapRightIcon: () => controller.isPasswordVisible.toggle(),
              );
            }),
            const SizedBox(height: 25),
            Obx(() {
              return RetrieveAccountPasswordTextInput(
                label: 'Confirme a senha',
                controller: controller.passwordConfirmationEC,
                validator: (val) => controller.requiredValidator(val ?? ''),
                isPasswordVisible:
                    controller.isPasswordConfirmationVisible.value,
                onTapRightIcon: () =>
                    controller.isPasswordConfirmationVisible.toggle(),
              );
            }),
            const SizedBox(height: 35),
            DefaultButton(
              fontSize: 16,
              borderRadius: 32,
              label: 'Confirmar',
              onPressed: () async => controller.handleResetPasswordEvent(),
              width: mq.size.width,
            ),
          ],
        ),
      ),
    );
  }
}
