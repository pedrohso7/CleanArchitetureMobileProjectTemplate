import 'package:clean_architeture_project/core/widgets/default_text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RegisterPasswordTextInput extends StatelessWidget {
  final VoidCallback onTapRightIcon;
  final TextEditingController controller;
  final String? label;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final bool isPasswordVisible;

  const RegisterPasswordTextInput({
    Key? key,
    required this.onTapRightIcon,
    required this.controller,
    this.label,
    this.inputFormatters,
    this.validator,
    this.isPasswordVisible = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextInput(
      contentPadding: const EdgeInsets.symmetric(vertical: 13),
      textInputAction: TextInputAction.none,
      textCapitalization: TextCapitalization.none,
      fillColor: Colors.white,
      borderColor: Colors.transparent,
      icon: Icon(
        MdiIcons.lock,
        color: Colors.grey,
        size: 25,
      ),
      label: Text(
        label ?? 'Senha',
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      controller: controller,
      validator: validator,
      suffixWidget: IconButton(
        splashColor: Colors.transparent,
        onPressed: onTapRightIcon,
        icon: isPasswordVisible
            ? Icon(
                MdiIcons.eye,
                color: Colors.grey,
                size: 25,
              )
            : Icon(
                MdiIcons.eyeOff,
                color: Colors.grey,
                size: 25,
              ),
      ),
      obscureText: !(isPasswordVisible),
    );
  }
}
