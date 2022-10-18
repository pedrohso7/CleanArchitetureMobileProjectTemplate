import 'package:answer_me_app/core/constants/color_constants.dart';
import 'package:answer_me_app/features/authentication/presenter/login/presentation/login_controller.dart';
import 'package:answer_me_app/features/authentication/presenter/login/presentation/views/login_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/animated_background.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.DEFAULT_BACKGROUND_COLOR,
      body: SingleChildScrollView(
        controller: controller.scrollController,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Obx(() {
              return AnimatedBackground(
                startAnimation: controller.showBlueBackground.value,
              );
            }),
            Obx(
              () {
                return LoginPageView(
                  startAnimation: controller.showModalPage.value,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
