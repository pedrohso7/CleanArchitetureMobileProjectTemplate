import 'package:answer_me_app/features/authentication/data/datasources/local_datasource.dart';
import 'package:answer_me_app/features/authentication/data/datasources/remote_datasource.dart';
import 'package:answer_me_app/features/authentication/data/repositories/user_repository.dart';
import 'package:answer_me_app/features/authentication/domain/repositories/user_repository_interface.dart';
import 'package:answer_me_app/features/authentication/domain/usecases/is_user_logged.dart';
import 'package:get/get.dart';
import 'splash_controller.dart';

class SplashBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalDataSourceInterface>(
      () => LocalDataSource(getStorage: Get.find()),
    );
    Get.lazyPut<RemoteDataSourceInterface>(
      () => RemoteDataSource(remoteClient: Get.find()),
    );
    Get.lazyPut<UserRepositoryInterface>(
      () => UserRepository(
          remoteDataSource: Get.find(), localDataSource: Get.find()),
    );

    Get.lazyPut<UserRepositoryInterface>(
      () => UserRepository(
          remoteDataSource: Get.find(), localDataSource: Get.find()),
    );

    Get.lazyPut(
      () => IsUserLogged(Get.find()),
    );

    Get.lazyPut(
      () => SplashController(isUserLoggedUsecase: Get.find()),
    );
  }
}
