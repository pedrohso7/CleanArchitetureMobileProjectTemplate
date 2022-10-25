class AuthErrors {
  AuthErrors._();
  static const Map<String, String> firebase_auth_errors = {
    "EMAIL_EXISTS": "Já existe um conta utilizando este email",
    "OPERATION_NOT_ALLOWED": "Operação não permitida",
    "TOO_MANY_ATTEMPTS_TRY_LATER":
        "Acesso bloqueado temporariamente devido ao número de tentativas",
    "EMAIL_NOT_FOUND": "Email não cadastrado",
    "WEAK_PASSWORD": "Sua senha deve conter pelo menos 6 caracteres",
    "INVALID_PASSWORD": "Senha incorreta",
    "USER_DISABLED": "O usuário foi desabilitado por algum administrador",
  };
}
