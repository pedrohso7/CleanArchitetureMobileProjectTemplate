import 'package:clean_architeture_project/core/constants/color_constants.dart';
import 'package:clean_architeture_project/core/widgets/default_back_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'views/retrieve_account_page_view.dart';
import 'retrieve_account_controller.dart';

class RetrieveAccountPage extends GetView<RetrieveAccountController> {
  const RetrieveAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.DEFAULT_BACKGROUND_COLOR,
      body: SafeArea(
        child: Column(
          children: [
            DefaultBackPageWidget(
              title: '',
              onTap: () async => await controller.handleTapBackEvent(),
            ),
            const SizedBox(height: 60),
            const Expanded(
              child: RetrieveAccountPageView(),
            ),
          ],
        ),
      ),
    );
  }
}
