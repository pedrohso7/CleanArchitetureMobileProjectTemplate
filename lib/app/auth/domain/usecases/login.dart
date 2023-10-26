import '../../../../core/result/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user.dart';
import '../protocols/auth_protocols.dart';

class Login implements UseCase<Future<User>, LoginParams> {
  final AuthProtocols authRepository;
  const Login(this.authRepository);

  @override
  Future<User> call(LoginParams params) async {
    final IResult<User> response = await authRepository.login(
      email: params.email,
      password: params.password,
    );

    if (response.isError) {
      throw (response as ErrorResult).exception;
    }

    return (response as SuccessResult).data;
  }
}

class LoginParams {
  final String email;
  final String password;

  LoginParams(
    this.email,
    this.password,
  );
}
