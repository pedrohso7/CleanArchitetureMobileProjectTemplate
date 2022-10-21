import 'package:clean_architeture_project/core/widgets/default_text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterTextInput extends StatelessWidget {
  final String label;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final IconData? icon;
  final Widget? suffixWidget;

  const RegisterTextInput({
    Key? key,
    required this.label,
    this.inputFormatters,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.icon,
    this.suffixWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextInput(
      contentPadding: const EdgeInsets.symmetric(vertical: 13),
      textCapitalization: TextCapitalization.none,
      textInputAction: TextInputAction.next,
      fillColor: Colors.white,
      borderColor: Colors.transparent,
      inputFormatters: inputFormatters,
      icon: Icon(icon, color: Colors.grey, size: 25),
      label: Text(
        label,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      suffixWidget: suffixWidget,
    );
  }
}
