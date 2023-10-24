import 'package:get_storage/get_storage.dart';

mixin UserDecodeMixin {
  bool checkIsUserLogged() {
    final String? expiryDate = GetStorage().read('expiryDate');

    if (expiryDate == null) {
      return false;
    }

    if (DateTime.parse(expiryDate).isAfter(DateTime.now())) {
      return true;
    }

    return false;
  }
}
