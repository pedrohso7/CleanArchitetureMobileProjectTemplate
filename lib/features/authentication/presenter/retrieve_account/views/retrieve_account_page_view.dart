import 'package:clean_architeture_project/core/constants/color_constants.dart';
import 'package:clean_architeture_project/core/widgets/default_button.dart';
import 'package:clean_architeture_project/features/authentication/presenter/retrieve_account/widgets/retrieve_account_textinput.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../retrieve_account_controller.dart';
import '../widgets/retrieve_account_stepper.dart';

class RetrieveAccountPageView extends GetView<RetrieveAccountController> {
  const RetrieveAccountPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mq = MediaQuery.of(context);

    return Form(
      key: controller.retrieveAccountGK,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Redefinir senha',
              style: TextStyle(
                color: context.theme.primaryColor,
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
              textScaleFactor: 1,
            ),
            const SizedBox(height: 25),
            const Text(
              'Digite o seu email e em breve você receberá um código de confirmação para redefinir sua senha',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ColorsConstants.COLOR_DARK,
                fontSize: 14,
              ),
              textScaleFactor: 1,
            ),
            const SizedBox(height: 33),
            RetrieveAccountTextInput(
              icon: MdiIcons.email,
              label: 'Insira o email',
              controller: controller.emailEC,
              validator: (val) => controller.emailValidator(val ?? ''),
            ),
            const SizedBox(height: 40),
            DefaultButton(
              fontSize: 16,
              borderRadius: 32,
              label: 'Enviar',
              onPressed: () async =>
                  await controller.handleRetrieveAccountEvent(),
              width: mq.size.width,
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () => controller.pageController.jumpTo(0),
              child: Text(
                'Voltar',
                style: TextStyle(
                  color: context.theme.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                // textScaleFactor: 1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
