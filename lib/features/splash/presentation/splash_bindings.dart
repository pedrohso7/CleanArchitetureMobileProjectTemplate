import 'package:clean_architeture_project/core/usecases/usecase.dart';
import 'package:clean_architeture_project/features/splash/domain/usecases/get_string_from_local_storage.dart';
import 'package:get/get.dart';
import '../data/datasources/splash_local_datasource.dart';
import '../data/repositories/splash_repository.dart';
import '../domain/repositories/splash_repository_interface.dart';
import 'splash_controller.dart';

class SplashBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashLocalDataSourceInterface>(
      () => SplashLocalDataSource(getStorage: Get.find()),
    );

    Get.lazyPut<SplashRepositoryInterface>(
      () => SplashRepository(
        localDataSource: Get.find(),
      ),
    );

    Get.lazyPut<UseCase<String, GSFLSParams>>(
      () => GetStringFromLocalStorage(Get.find()),
    );

    Get.lazyPut(
      () => SplashController(
        getStringFromLocalStorage: Get.find(),
      ),
    );
  }
}
