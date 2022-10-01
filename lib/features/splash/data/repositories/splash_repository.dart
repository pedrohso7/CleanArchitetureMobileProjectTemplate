import '../../domain/entities/user.dart';
import '../../domain/repositories/splash_repository_interface.dart';
import '../datasources/local_datasource.dart';
import '../datasources/remote_datasource.dart';

class SplashRepository implements SplashRepositoryInterface {
  final RemoteDataSourceInterface remoteDataSource;
  final LocalDataSourceInterface localDataSource;

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
