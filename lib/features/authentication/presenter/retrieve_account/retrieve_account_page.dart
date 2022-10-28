import 'package:clean_architeture_project/core/constants/color_constants.dart';
import 'package:clean_architeture_project/core/widgets/default_back_page_widget.dart';
import 'package:clean_architeture_project/features/authentication/presenter/retrieve_account/views/change_password_page.dart';
import 'package:clean_architeture_project/features/authentication/presenter/retrieve_account/views/code_confirmation_page.dart';
import 'package:clean_architeture_project/features/authentication/presenter/retrieve_account/views/retrieve_account_page_view.dart';
import 'package:clean_architeture_project/features/authentication/presenter/retrieve_account/widgets/retrieve_account_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'retrieve_account_controller.dart';

class RetrieveAccountPage extends GetView<RetrieveAccountController> {
  const RetrieveAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mq = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: ColorsConstants.DEFAULT_BACKGROUND_COLOR,
      body: SafeArea(
        child: Column(
          children: [
            DefaultBackPageWidget(
              title: '',
              onTap: () async => await controller.handleTapBackEvent(),
            ),
            const SizedBox(height: 20),
            Obx(() {
              return RetrieveAccountStepper(step: controller.step.value);
            }),
            const SizedBox(height: 60),
            Expanded(
              child: Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.symmetric(
                  horizontal: 60,
                ),
                height: mq.size.height,
                width: mq.size.width,
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: controller.pageController,
                  children: const [
                    RetrieveAccountPageView(),
                    CodeConfirmationPage(),
                    ChangePasswordPage(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
