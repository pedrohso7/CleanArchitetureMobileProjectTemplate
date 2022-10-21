import 'package:clean_architeture_project/core/widgets/default_back_page_widget.dart';
import 'package:clean_architeture_project/core/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'register_controller.dart';
import 'widgets/register_password_textinput.dart';
import 'widgets/register_textinput.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mq = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 224, 224),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          controller: controller.scrollController,
          child: Column(
            children: [
              DefaultBackPageWidget(
                title: '',
                onTap: () async => await controller.handleTapBackEvent(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 60,
                ),
                child: Form(
                  key: controller.registerGK,
                  child: Column(
                    children: [
                      const SizedBox(height: 25),
                      Text(
                        'Cadastro',
                        style: TextStyle(
                          color: context.theme.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                        ),
                      ),
                      const SizedBox(height: 32),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(thickness: 1),
                      ),
                      const SizedBox(height: 30),
                      RegisterTextInput(
                        label: 'Nome',
                        controller: controller.nameEC,
                        validator: (val) =>
                            controller.requiredValidator(val ?? ''),
                        icon: MdiIcons.accountBox,
                      ),
                      const SizedBox(height: 25),
                      RegisterTextInput(
                        label: 'Email',
                        controller: controller.emailEC,
                        validator: (val) =>
                            controller.emailValidator(val ?? ''),
                        keyboardType: TextInputType.emailAddress,
                        icon: MdiIcons.email,
                      ),
                      const SizedBox(height: 25),
                      Obx(() {
                        return RegisterPasswordTextInput(
                          onTapRightIcon: () =>
                              controller.isPasswordVisible.toggle(),
                          controller: controller.passwordEC,
                          isPasswordVisible: controller.isPasswordVisible.value,
                          validator: (val) =>
                              controller.requiredValidator(val ?? ''),
                        );
                      }),
                      const SizedBox(height: 25),
                      Obx(() {
                        return RegisterPasswordTextInput(
                          onTapRightIcon: () =>
                              controller.isPasswordConfirmationVisible.toggle(),
                          controller: controller.passwordConfirmationEC,
                          label: 'Confirme sua senha',
                          isPasswordVisible:
                              controller.isPasswordConfirmationVisible.value,
                          validator: (val) =>
                              controller.requiredValidator(val ?? ''),
                        );
                      }),
                      const SizedBox(height: 35),
                      DefaultButton(
                        borderRadius: 32,
                        label: 'CADASTRAR',
                        fontSize: 16,
                        onPressed: () async => await controller.register(),
                        width: mq.size.width,
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
