enum FirebaseAuthErrors {
  emailExists('Já existe uma conta utilizando este email'),
  operationNotAllowed('Operação não permitida'),
  tooManyAttemptsTryLater(
      'Acesso bloqueado temporariamente devido ao número de tentativas'),
  emailNotFound('Email não cadastrado'),
  weakPassword('Sua senha deve conter pelo menos 6 caracteres'),
  invalidPassword('Senha incorreta'),
  userDisabled('O usuário foi desabilitado por algum administrador'),
  resetPasswordExceedLimit(
      'Você chegou ao limite de solicitações de troca de senha');

  final String message;
  const FirebaseAuthErrors(this.message);

  static FirebaseAuthErrors fromCodeMessage(String value) {
    switch (value) {
      case "EMAIL_EXISTS":
        return FirebaseAuthErrors.emailExists;
      case "OPERATION_NOT_ALLOWED":
        return FirebaseAuthErrors.operationNotAllowed;
      case "TOO_MANY_ATTEMPTS_TRY_LATER":
        return FirebaseAuthErrors.tooManyAttemptsTryLater;
      case "EMAIL_NOT_FOUND":
        return FirebaseAuthErrors.emailNotFound;
      case "WEAK_PASSWORD":
        return FirebaseAuthErrors.weakPassword;
      case "INVALID_PASSWORD":
        return FirebaseAuthErrors.invalidPassword;
      case "USER_DISABLED":
        return FirebaseAuthErrors.userDisabled;
      case "RESET_PASSWORD_EXCEED_LIMIT":
        return FirebaseAuthErrors.resetPasswordExceedLimit;
      default:
        return FirebaseAuthErrors.emailNotFound;
    }
  }
}
