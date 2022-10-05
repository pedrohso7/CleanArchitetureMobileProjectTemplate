import 'package:get/get.dart';

mixin ValidatorsMixin {
  String? requiredValidator(String val) {
    if (val.isEmpty) {
      return 'Campo obrigatório.';
    }
    return null;
  }

  String? emailValidator(String val) {
    if (val.isEmpty) {
      return 'Campo obrigatório.';
    }
    if (!(GetUtils.isEmail(val))) {
      return 'Email inválido.';
    }
    return null;
  }
}
