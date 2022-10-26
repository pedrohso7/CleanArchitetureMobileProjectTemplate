import 'package:clean_architeture_project/core/usecases/usecase.dart';
import 'package:get/get.dart';

import '../data/datasources/home_local_datasource.dart';
import '../data/repositories/home_repository.dart';
import '../domain/repositories/home_repository_interface.dart';
import '../domain/usecases/remove_auth_cached_data.dart';
import 'home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeLocalDataSourceInterface>(
      () => HomeLocalDataSource(
        getStorage: Get.find(),
      ),
    );

    Get.lazyPut<HomeRepositoryInterface>(
      () => HomeRepository(
        localDataSource: Get.find(),
      ),
    );

    Get.lazyPut<UseCase<void, NoParams>>(
      () => RemoveAuthCachedData(Get.find()),
    );

    Get.lazyPut(
      () => HomeController(
        removeAuthCachedData: Get.find(),
      ),
    );
  }
}
