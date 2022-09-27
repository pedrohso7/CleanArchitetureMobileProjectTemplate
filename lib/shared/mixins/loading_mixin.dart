import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin LoaderMixin on GetxController {
  final loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    ever(loading, (_) async {
      if (loading.isTrue) {
        await Get.dialog(
          WillPopScope(
            onWillPop: () async => false,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          barrierDismissible: false,
        );
      } else {
        Get.back();
      }
    });
  }
}
