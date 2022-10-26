import 'package:clean_architeture_project/core/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: DefaultButton(
          label: 'Logout',
          onPressed: () => controller.handleLogoutButtonAction(),
        ),
      ),
    );
  }
}
