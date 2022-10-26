import 'package:clean_architeture_project/core/errors/local_storage_exception.dart';
import 'package:clean_architeture_project/core/usecases/usecase.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final UseCase<void, NoParams> _removeAuthCachedData;

  HomeController({
    required UseCase<void, NoParams> removeAuthCachedData,
  }) : _removeAuthCachedData = removeAuthCachedData;

  void handleLogoutButtonAction() {
    try {
      _removeAuthCachedData.call(NoParams());
      Get.offAllNamed('/auth/login');
    } on LocalStorageException {
      Get.offAllNamed('/auth/login');
    }
  }
}
