import 'package:answer_me_app/core/usecases/usecase.dart';
import 'package:answer_me_app/features/splash/domain/usecases/get_token_from_local_storage.dart';
import 'package:answer_me_app/features/splash/domain/usecases/get_user_from_local_storage.dart';
import 'package:get/get.dart';
import '../data/datasources/splash_local_datasource.dart';
import '../data/datasources/splash_remote_datasource.dart';
import '../data/repositories/splash_repository.dart';
import '../domain/entities/user.dart';
import '../domain/repositories/splash_repository_interface.dart';
import '../domain/usecases/is_user_logged.dart';
import 'splash_controller.dart';

class SplashBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashLocalDataSourceInterface>(
      () => SplashLocalDataSource(getStorage: Get.find()),
    );

    Get.lazyPut<SplashRemoteDataSourceInterface>(
      () => SplashRemoteDataSource(remoteClient: Get.find()),
    );

    Get.lazyPut<SplashRepositoryInterface>(
      () => SplashRepository(
        remoteDataSource: Get.find(),
        localDataSource: Get.find(),
      ),
    );

    Get.lazyPut<UseCase<Future<bool>, IsUserLoggedParams>>(
      () => IsUserLogged(Get.find()),
    );

    Get.lazyPut<UseCase<String, NoParams>>(
      () => GetTokenFromLocalStorage(Get.find()),
    );

    Get.lazyPut<UseCase<User, NoParams>>(
      () => GetUserFromLocalStorage(Get.find()),
    );

    Get.lazyPut(
      () => SplashController(
        isUserLogged: Get.find(),
        getTokenFromLocalStorage: Get.find(),
        getUserFromLocalStorage: Get.find(),
      ),
    );
  }
}
