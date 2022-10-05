import 'package:get/get.dart';

mixin ValidatorsMixin on GetxController {
  String requiredValidator(String val) {
    if (val.isEmpty) {
      return 'Campo obrigatório.';
    }
    return '';
  }

  String emailValidator(String val) {
    if (val.isEmpty) {
      return 'Campo obrigatório.';
    }
    if (GetUtils.isEmail(val)) {
      return 'Email inválido.';
    }
    return '';
  }
}
