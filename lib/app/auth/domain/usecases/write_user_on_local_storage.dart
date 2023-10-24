import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/result/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../protocols/auth_protocols.dart';

class WriteUserOnLocalStorage implements UseCase<void, WUOLSParams> {
  final AuthProtocols authRepository = Modular.get<AuthProtocols>();

  @override
  Future<void> call(WUOLSParams params) async {
    final IResult<void> response =
        authRepository.writeUserOnLocalStorage(user: params.user);

    if (response.isError) {
      throw (response as ErrorResult).exception;
    }
  }
}

class WUOLSParams {
  final Map user;

  WUOLSParams(
    this.user,
  );
}
