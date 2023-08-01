import 'package:clean_architeture_project/core/constants/color_constants.dart';
import 'package:clean_architeture_project/core/widgets/default_back_page_widget.dart';
import 'package:clean_architeture_project/core/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'retrieve_account_controller.dart';
import 'widgets/retrieve_account_textinput.dart';

class RetrieveAccountPage extends GetView<RetrieveAccountController> {
  const RetrieveAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mq = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: ColorsConstants.defaultBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            DefaultBackPageWidget(
              title: '',
              onTap: () async => await controller.handleTapBackEvent(),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 60,
                ),
                child: Form(
                  key: controller.retrieveAccountGK,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 25),
                        Text(
                          'Redefinir senha',
                          style: TextStyle(
                            color: context.theme.primaryColor,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                          textScaleFactor: 1,
                        ),
                        const SizedBox(height: 25),
                        const Text(
                          'Digite o seu email e em breve você receberá um link para redefinir sua senha',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ColorsConstants.dark,
                            fontSize: 14,
                          ),
                          textScaleFactor: 1,
                        ),
                        const SizedBox(height: 33),
                        RetrieveAccountTextInput(
                          icon: MdiIcons.email,
                          label: 'Insira o email',
                          controller: controller.emailEC,
                          validator: (val) =>
                              controller.emailValidator(val ?? ''),
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
                          onPressed: () => Get.back(),
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
