import '../../../../core/result/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../protocols/auth_protocols.dart';

class WriteStringOnLocalStorage implements UseCase<void, WSOLSParams> {
  final AuthProtocols authRepository;
  const WriteStringOnLocalStorage(this.authRepository);

  @override
  Future<void> call(WSOLSParams params) async {
    final IResult<void> response = authRepository.writeStringOnLocalStorage(
      key: params.key,
      value: params.value,
    );

    if (response.isError) {
      throw (response as ErrorResult).exception;
    }
  }
}

class WSOLSParams {
  final String key;
  final String value;

  WSOLSParams(
    this.key,
    this.value,
  );
}
