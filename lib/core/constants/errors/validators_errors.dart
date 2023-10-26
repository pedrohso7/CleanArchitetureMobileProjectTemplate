enum ValidatorsErrors {
  emptyField('Campo obrigatório'),
  invalidEmail('Email inválido'),
  passwordsAreNotEqual('Senhas diferem.'),
  weakPassword('Sua senha deve conter pelo menos 6 caracteres');

  final String message;
  const ValidatorsErrors(this.message);
}
