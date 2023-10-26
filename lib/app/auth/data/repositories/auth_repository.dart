import 'package:dio/dio.dart';

import '../../../../core/constants/errors/firebase_auth_errors.dart';
import '../../../../core/errors/local_storage_exception.dart';
import '../../../../core/errors/remote_client_exception.dart';
import '../../../../core/result/result.dart';
import '../../domain/entities/user.dart';
import '../../domain/protocols/auth_protocols.dart';
import '../datasources/auth_local_datasource.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepository implements AuthProtocols {
  final AuthRemoteDataSourceInterface remoteDataSource;
  final AuthLocalDataSourceInterface localDataSource;

  AuthRepository(this.remoteDataSource, this.localDataSource);

  @override
  Future<IResult<User>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      return SuccessResult(await remoteDataSource.register(
        name: name,
        email: email,
        password: password,
      ));
    } on RemoteClientException catch (error) {
      return ErrorResult(error);
    } on DioException catch (error) {
      //Only on firebase requests.
      final errorMessage = error.response?.data['error']['message'];
      final codeMessage = errorMessage.split(' ')[0];
      if (codeMessage != null) {
        return ErrorResult(RemoteClientException(
            FirebaseAuthErrors.fromCodeMessage(codeMessage).message));
      }

      return ErrorResult(RemoteClientException('Erro ao realizar cadastro'));
    }
  }

  @override
  Future<IResult<User>> login({
    required String email,
    required String password,
  }) async {
    try {
      return SuccessResult(await remoteDataSource.login(
        email: email,
        password: password,
      ));
    } on RemoteClientException catch (error) {
      return ErrorResult(error);
    } on DioException catch (error) {
      //Only on firebase requests.
      final errorMessage = error.response?.data['error']['message'];
      final codeMessage = errorMessage.split(' ')[0];
      if (codeMessage != null) {
        return ErrorResult(RemoteClientException(
            FirebaseAuthErrors.fromCodeMessage(codeMessage).message));
      }

      return ErrorResult(RemoteClientException('Erro ao realizar login'));
    }
  }

  @override
  Future<IResult<Response>> sendResetPasswordEmail({
    required String email,
  }) async {
    try {
      return SuccessResult(await remoteDataSource.sendResetPasswordEmail(
        email: email,
      ));
    } on RemoteClientException catch (error) {
      return ErrorResult(error);
    } on DioException catch (error) {
      //Only on firebase requests.
      final errorMessage = error.response?.data['error']['message'];
      final codeMessage = errorMessage.split(' ')[0];
      if (codeMessage != null) {
        return ErrorResult(RemoteClientException(
            FirebaseAuthErrors.fromCodeMessage(codeMessage).message));
      }

      return ErrorResult(RemoteClientException(
          'Erro ao enviar e-mail de recuperação de senha'));
    }
  }

  @override
  IResult<void> writeUserOnLocalStorage({required Map user}) {
    try {
      return SuccessResult(localDataSource.writeUserOnLocalStorage(user));
    } on LocalStorageException catch (error) {
      return ErrorResult(error);
    }
  }

  @override
  IResult<void> writeStringOnLocalStorage({
    required String key,
    required String value,
  }) {
    try {
      return SuccessResult(
          localDataSource.writeStringOnLocalStorage(key, value));
    } on LocalStorageException catch (error) {
      return ErrorResult(error);
    }
  }
}
