import '../constants/errors/validators_errors.dart';

mixin ValidatorsMixin {
  String? requiredValidator(String? val) {
    if (val == null || val.isEmpty) {
      return ValidatorsErrors.emptyField.message;
    }
    return null;
  }

  bool _isEmailValid(String email) {
    String emailRegex =
        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'; // Regular expression for email validation
    RegExp regExp = RegExp(emailRegex);
    return regExp.hasMatch(email);
  }

  String? emailValidator(String? val) {
    if (val == null || val.isEmpty) {
      return ValidatorsErrors.emptyField.message;
    }
    if (!(_isEmailValid(val))) {
      return ValidatorsErrors.invalidEmail.message;
    }
    return null;
  }

  String? passwordConfirmationValidator(String? val, password) {
    if (val == null || val.isEmpty) {
      return ValidatorsErrors.emptyField.message;
    }
    if (password != val) {
      return ValidatorsErrors.passwordsAreNotEqual.message;
    }
    return null;
  }
}
