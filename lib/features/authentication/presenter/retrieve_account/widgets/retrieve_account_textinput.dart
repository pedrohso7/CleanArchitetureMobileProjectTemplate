import 'package:clean_architeture_project/core/widgets/default_text_input.dart';
import 'package:flutter/material.dart';

class RetrieveAccountTextInput extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final String? Function(String?)? validator;
  final IconData? icon;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;

  const RetrieveAccountTextInput({
    Key? key,
    required this.controller,
    this.label,
    this.validator,
    this.icon,
    this.keyboardType,
    this.textCapitalization,
    this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextInput(
      contentPadding: const EdgeInsets.symmetric(vertical: 10),
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      textInputAction: textInputAction ?? TextInputAction.next,
      borderColor: Colors.transparent,
      icon: icon != null
          ? Icon(
              icon,
              color: Colors.grey,
              size: 25,
            )
          : null,
      label: label != null
          ? Text(
              label!,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textScaleFactor: 1,
            )
          : null,
      controller: controller,
      validator: validator,
      keyboardType: keyboardType ?? TextInputType.emailAddress,
    );
  }
}
