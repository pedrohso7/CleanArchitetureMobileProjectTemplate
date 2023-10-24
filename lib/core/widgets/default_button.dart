import 'package:flutter/material.dart';

import '../constants/theme/colors.dart';
import '../constants/theme/sizes.dart';
import '../constants/theme/text_style.dart';

class DefaultButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isSecondaryStyle;
  final String label;
  final double? width;
  final double height;
  final double borderRadius;
  final Widget? child;

  const DefaultButton({
    Key? key,
    required this.onPressed,
    this.isSecondaryStyle = false,
    this.label = '',
    this.width,
    this.height = AppSizes.s56,
    this.borderRadius = AppSizes.s4,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          backgroundColor:
              isSecondaryStyle ? AppColors.transparent : AppColors.primaryColor,
          elevation: isSecondaryStyle ? 0 : null,
        ),
        child: child ??
            Text(
              label,
              style: isSecondaryStyle
                  ? AppTextStyles.defaultYellowText
                  : AppTextStyles.defaultText,
            ),
      ),
    );
  }
}
