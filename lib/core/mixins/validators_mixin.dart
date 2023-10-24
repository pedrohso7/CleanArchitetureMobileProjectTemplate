mixin ValidatorsMixin {
  String? requiredValidator(String val) {
    if (val.isEmpty) {
      return 'Campo obrigatório.';
    }
    return null;
  }

  bool _isEmailValid(String email) {
    String emailRegex =
        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'; // Regular expression for email validation
    RegExp regExp = RegExp(emailRegex);
    return regExp.hasMatch(email);
  }

  String? emailValidator(String val) {
    if (val.isEmpty) {
      return 'Campo obrigatório.';
    }
    if (!(_isEmailValid(val))) {
      return 'Email inválido.';
    }
    return null;
  }

  String? passwordConfirmationValidator(String val, password) {
    if (val.isEmpty) {
      return 'Campo obrigatório.';
    }
    if (password != val) {
      return 'Senhas diferem.';
    }
    return null;
  }
}
