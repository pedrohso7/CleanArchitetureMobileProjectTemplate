import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../core/constants/theme/sizes.dart';
import '../../../../../core/widgets/password_text_input.dart';

class LoginPasswordTextInput extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const LoginPasswordTextInput({
    Key? key,
    required this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PasswordTextInput(
      icon: Icon(
        MdiIcons.lock,
        color: Colors.grey,
        size: AppSizes.s24,
      ),
      controller: controller,
      validator: validator,
    );
  }
}
