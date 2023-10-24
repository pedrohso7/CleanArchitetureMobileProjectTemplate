import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../core/constants/theme/colors.dart';
import '../../../../../core/constants/theme/sizes.dart';
import '../../../../../core/constants/theme/text_style.dart';
import '../../../../../core/extensions/sized_box_extension.dart';
import '../../../../../core/mixins/validators_mixin.dart';
import '../../../../../core/widgets/default_back_page_widget.dart';
import '../../../../../core/widgets/default_button.dart';
import '../../../../../core/widgets/default_text_input.dart';

class RetrieveAccountScreen extends StatelessWidget with ValidatorsMixin {
  const RetrieveAccountScreen({
    Key? key,
    required this.emailController,
    required this.formKey,
    required this.onPressButton,
    required this.onPressBackButton,
  }) : super(key: key);

  final TextEditingController emailController;
  final GlobalKey formKey;
  final VoidCallback onPressButton;
  final VoidCallback onPressBackButton;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mq = MediaQuery.of(context);

    return SafeArea(
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              DefaultBackPageWidget(title: '', onTap: onPressBackButton),
              VerticalSpace.s24,
              const Text(
                'Redefinir senha',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: AppFontSizes.s36,
                  fontWeight: FontWeight.bold,
                ),
                textScaleFactor: 1,
              ),
              VerticalSpace.s24,
              const Text(
                'Digite o seu email e em breve você receberá um link para redefinir sua senha',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: AppFontSizes.s14,
                ),
                textScaleFactor: 1,
              ),
              VerticalSpace.s32,
              DefaultTextInput(
                textCapitalization: TextCapitalization.none,
                textInputAction: TextInputAction.next,
                borderColor: Colors.transparent,
                icon: Icon(
                  MdiIcons.email,
                  color: AppColors.grey,
                  size: AppSizes.s24,
                ),
                label: 'Insira o email',
                controller: emailController,
                validator: (val) => emailValidator(val ?? ''),
                keyboardType: TextInputType.emailAddress,
              ),
              VerticalSpace.s40,
              DefaultButton(
                // fontSize: 16,
                borderRadius: AppSizes.s32,
                label: 'Enviar',
                onPressed: onPressButton,
                width: mq.size.width,
              ),
              VerticalSpace.s8,
            ],
          ),
        ),
      ),
    );
  }
}
