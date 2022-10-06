import 'package:answer_me_app/core/widgets/default_text_input.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LoginPasswordTextInput extends StatelessWidget {
  final VoidCallback onTapRightIcon;
  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;
  final bool isPasswordVisible;

  const LoginPasswordTextInput({
    Key? key,
    required this.onTapRightIcon,
    required this.controller,
    this.label = 'Senha',
    this.validator,
    this.isPasswordVisible = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextInput(
      contentPadding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      textCapitalization: TextCapitalization.none,
      icon: const Icon(
        MdiIcons.lock,
        color: Colors.grey,
        size: 25,
      ),
      label: Text(
        label,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        textScaleFactor: 1,
      ),
      controller: controller,
      validator: validator,
      suffixWidget: IconButton(
        splashColor: Colors.transparent,
        onPressed: onTapRightIcon,
        icon: isPasswordVisible
            ? const Icon(
                MdiIcons.eye,
                color: Colors.grey,
                size: 25,
              )
            : const Icon(
                MdiIcons.eyeOff,
                color: Colors.grey,
                size: 25,
              ),
      ),
      obscureText: !isPasswordVisible,
    );
  }
}
