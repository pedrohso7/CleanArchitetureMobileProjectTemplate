import 'package:flutter_easyloading/flutter_easyloading.dart';

enum ToastType { error, success }

mixin EasyLoadingMixin {
  Future<void> showLoading({String message = 'loading...'}) async =>
      await EasyLoading.show(
        status: message,
        maskType: EasyLoadingMaskType.black,
      );

  Future<void> showToast(
    String message, {
    ToastType type = ToastType.error,
  }) async {
    if (ToastType.error == type) {
      EasyLoading.showError(
        message,
        maskType: EasyLoadingMaskType.custom,
      );
      return;
    }
    EasyLoading.showSuccess(message);
  }

  Future<void> dismiss() async => await EasyLoading.dismiss();
}
