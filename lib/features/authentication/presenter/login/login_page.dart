import 'package:clean_architeture_project/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_controller.dart';
import 'views/login_page_view.dart';
import 'widgets/animated_background.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.defaultBackgroundColor,
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
