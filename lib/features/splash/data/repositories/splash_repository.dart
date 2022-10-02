import '../../domain/entities/user.dart';
import '../../domain/repositories/splash_repository_interface.dart';
import '../datasources/splash_local_datasource.dart';
import '../datasources/splash_remote_datasource.dart';

class SplashRepository implements SplashRepositoryInterface {
  final SplashRemoteDataSourceInterface remoteDataSource;
  final SplashLocalDataSourceInterface localDataSource;

  SplashRepository({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<bool> isUserTokenValid({
    required String token,
    required String userId,
  }) async {
    return remoteDataSource.isUserTokenValid(
      token: token,
      userId: userId,
    );
  }

  @override
  User? getUserFromLocalStorage() {
    return localDataSource.getUserFromLocalStorage();
  }

  @override
  String? getTokenFromLocalStorage() {
    return localDataSource.getTokenFromLocalStorage();
  }
}
