import 'package:answer_me_app/features/authentication/login/presentation/login_controller.dart';
import 'package:answer_me_app/features/authentication/login/presentation/views/login_page_view.dart';
import 'package:answer_me_app/features/authentication/login/presentation/widgets/animated_blue_background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 224, 224),
      body: SingleChildScrollView(
        controller: controller.scrollController,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Obx(() {
              return AnimatedBlueBackground(
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
