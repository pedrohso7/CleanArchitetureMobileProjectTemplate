import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../core/widgets/default_text_input.dart';
import '../constants/theme/colors.dart';
import '../constants/theme/sizes.dart';

class PasswordTextInput extends StatefulWidget {
  const PasswordTextInput({
    super.key,
    this.label = 'Senha',
    this.contentPadding = const EdgeInsets.symmetric(vertical: 0.0),
    this.borderColor = Colors.transparent,
    this.fillColor = Colors.white,
    this.radius = 25.0,
    this.icon,
    required this.controller,
    this.suffixWidget,
    this.validator,
    this.onChange,
    this.onEditingComplete,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
    this.focusNode,
    this.textAlignVertical,
    this.textAlign = TextAlign.start,
    this.textInputAction = TextInputAction.done,
  });
  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;
  final EdgeInsets contentPadding;
  final Color borderColor;
  final Color fillColor;
  final double radius;
  final Widget? icon;
  final Widget? suffixWidget;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChange;
  final VoidCallback? onEditingComplete;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final FocusNode? focusNode;
  final TextAlignVertical? textAlignVertical;
  final TextAlign textAlign;
  final TextInputAction? textInputAction;
  @override
  State<PasswordTextInput> createState() => _PasswordTextInputState();
}

class _PasswordTextInputState extends State<PasswordTextInput> {
  bool isPasswordVisible = false;

  void setPasswordIconVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextInput(
      onEditingComplete: widget.onEditingComplete,
      textInputAction: widget.textInputAction,
      textAlign: widget.textAlign,
      textAlignVertical: widget.textAlignVertical,
      textCapitalization: widget.textCapitalization,
      focusNode: widget.focusNode,
      obscureText: !isPasswordVisible,
      onChange: widget.onChange,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      controller: widget.controller,
      label: widget.label,
      suffixWidget: IconButton(
        splashColor: Colors.transparent,
        onPressed: setPasswordIconVisibility,
        icon: isPasswordVisible
            ? Icon(
                MdiIcons.eye,
                color: Colors.grey,
                size: AppSizes.s24,
              )
            : Icon(
                MdiIcons.eyeOff,
                color: AppColors.grey,
                size: AppSizes.s24,
              ),
      ),
      icon: Icon(
        MdiIcons.lock,
        color: AppColors.grey,
        size: AppSizes.s24,
      ),
    );
  }
}
