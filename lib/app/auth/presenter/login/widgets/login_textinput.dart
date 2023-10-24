import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../core/widgets/default_text_input.dart';

class LoginTextInput extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;
  final bool isPasswordVisible;

  const LoginTextInput({
    Key? key,
    required this.controller,
    required this.label,
    this.validator,
    this.isPasswordVisible = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextInput(
      textCapitalization: TextCapitalization.none,
      textInputAction: TextInputAction.next,
      borderColor: Colors.transparent,
      icon: Icon(
        MdiIcons.email,
        color: Colors.grey,
        size: 25,
      ),
      label: label,
      controller: controller,
      validator: validator,
      keyboardType: TextInputType.emailAddress,
    );
  }
}
