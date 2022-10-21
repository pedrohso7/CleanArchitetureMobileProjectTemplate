import 'package:clean_architeture_project/core/constants/image_path_constants.dart';
import 'package:clean_architeture_project/features/splash/presentation/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    throw ('teste');
    Future.delayed(
      const Duration(seconds: 2),
      () async => await controller.handleFirstRedirect(),
    );
    return Scaffold(
      backgroundColor: context.theme.primaryColor,
      body: Center(
        child: SizedBox(
          width: 300,
          height: 300,
          child: ClipOval(
            child: Material(
              color: Colors.white,
              child: Image.asset(ImagePathConstants.BRAIN_LOGO_PATH),
            ),
          ),
        ),
      ),
    );
  }
}
