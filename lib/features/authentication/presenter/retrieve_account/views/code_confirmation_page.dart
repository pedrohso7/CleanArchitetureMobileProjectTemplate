import 'package:clean_architeture_project/core/constants/color_constants.dart';
import 'package:clean_architeture_project/core/widgets/default_button.dart';
import 'package:clean_architeture_project/features/authentication/presenter/retrieve_account/widgets/retrieve_account_textinput.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../retrieve_account_controller.dart';

class CodeConfirmationPage extends GetView<RetrieveAccountController> {
  const CodeConfirmationPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mq = MediaQuery.of(context);

    return Form(
      key: controller.codeConfirmationGK,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Digite o código',
              style: TextStyle(
                color: context.theme.primaryColor,
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
              textScaleFactor: 1,
            ),
            const SizedBox(height: 25),
            const Text(
              'Um código foi enviado para o número digitado, insira-o abaixo e prossiga para redefinir sua senha',
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: ColorsConstants.COLOR_DARK,
                fontSize: 14,
              ),
              textScaleFactor: 1,
            ),
            const SizedBox(height: 33),
            Row(
              children: [
                Expanded(
                  child: RetrieveAccountTextInput(
                    label: '',
                    controller: controller.firstEC,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: RetrieveAccountTextInput(
                    label: '',
                    controller: controller.secondEC,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: RetrieveAccountTextInput(
                    label: '',
                    controller: controller.thirdEC,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: RetrieveAccountTextInput(
                    label: '',
                    controller: controller.fourthEC,
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: () => {},
              child: Text(
                'Caso não receba, clique aqui para reenviar',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: context.theme.primaryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                textScaleFactor: 1,
              ),
            ),
            DefaultButton(
              fontSize: 16,
              borderRadius: 32,
              label: 'Confirmar',
              onPressed: () async => controller.handleCodeConfirmationEvent(),
              width: mq.size.width,
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () => Get.back(),
              child: Text(
                'Cancelar',
                style: TextStyle(
                  color: context.theme.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                // textScaleFactor: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
