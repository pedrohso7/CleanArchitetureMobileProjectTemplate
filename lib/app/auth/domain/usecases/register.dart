import '../../../../core/result/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user.dart';
import '../protocols/auth_protocols.dart';

class Register implements UseCase<Future<User>, RegisterParams> {
  final AuthProtocols authRepository;
  const Register(this.authRepository);

  @override
  Future<User> call(RegisterParams params) async {
    final IResult<User> response = await authRepository.register(
      name: params.name,
      email: params.email,
      password: params.password,
    );

    if (response.isError) {
      throw (response as ErrorResult).exception;
    }

    return (response as SuccessResult).data;
  }
}

class RegisterParams {
  final String name;
  final String email;
  final String password;

  RegisterParams(
    this.name,
    this.email,
    this.password,
  );
}
