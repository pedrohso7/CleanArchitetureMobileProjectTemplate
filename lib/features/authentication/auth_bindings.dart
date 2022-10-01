import 'package:answer_me_app/features/authentication/data/datasources/local_datasource.dart';
import 'package:answer_me_app/features/authentication/data/datasources/remote_datasource.dart';
import 'package:answer_me_app/features/authentication/data/repositories/user_repository.dart';
import 'package:answer_me_app/features/authentication/domain/repositories/user_repository_interface.dart';
import 'package:get/get.dart';

class AuthBindings implements Bindings {
  @override
  void dependencies() {
    //From data
    Get.lazyPut<RemoteDataSourceInterface>(
      () => RemoteDataSource(
        remoteClient: Get.find(),
      ),
    );
    Get.lazyPut<LocalDataSourceInterface>(
      () => LocalDataSource(
        getStorage: Get.find(),
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
