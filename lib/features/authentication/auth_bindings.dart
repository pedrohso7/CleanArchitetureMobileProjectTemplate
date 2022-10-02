import 'package:get/get.dart';

import 'data/datasources/auth_local_datasource.dart';
import 'data/datasources/auth_remote_datasource.dart';
import 'data/repositories/user_repository.dart';
import 'domain/repositories/user_repository_interface.dart';

class AuthBindings implements Bindings {
  @override
  void dependencies() {
    //From data
    Get.lazyPut<AuthLocalDataSourceInterface>(
      () => AuthLocalDataSource(
        getStorage: Get.find(),
      ),
    );

    Get.lazyPut<AuthRemoteDataSourceInterface>(
      () => AuthRemoteDataSource(
        remoteClient: Get.find(),
      ),
    );

    Get.lazyPut<UserRepositoryInterface>(
      () => UserRepository(
        remoteDataSource: Get.find(),
        localDataSource: Get.find(),
      ),
    );
  }
}
