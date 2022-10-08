import 'package:answer_me_app/features/splash/presentation/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.redirect();
    return Scaffold(
      backgroundColor: context.theme.primaryColor,
      body: Center(
        child: SizedBox(
          width: 300,
          height: 300,
          child: ClipOval(
            child: Material(
              color: Colors.white,
              child: Image.asset('lib/assets/images/brain.png'),
            ),
          ),
        ),
      ),
    );
  }
}
