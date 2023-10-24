import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/constants/theme/colors.dart';
import '../../../../../core/constants/theme/sizes.dart';
import '../../../../../core/widgets/default_text_input.dart';

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
      textCapitalization: TextCapitalization.none,
      textInputAction: TextInputAction.next,
      fillColor: AppColors.white,
      borderColor: Colors.transparent,
      inputFormatters: inputFormatters,
      icon: Icon(icon, color: AppColors.grey, size: AppSizes.s24),
      label: label,
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      suffixWidget: suffixWidget,
    );
  }
}
