import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../core/constants/theme/sizes.dart';
import '../../../../../core/widgets/password_text_input.dart';

class RegisterPasswordTextInput extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;

  const RegisterPasswordTextInput({
    Key? key,
    required this.controller,
    this.label,
    this.inputFormatters,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PasswordTextInput(
      fillColor: Colors.white,
      borderColor: Colors.transparent,
      icon: Icon(
        MdiIcons.lock,
        color: Colors.grey,
        size: AppSizes.s24,
      ),
      label: label ?? 'Senha',
      controller: controller,
      validator: validator,
    );
  }
}
