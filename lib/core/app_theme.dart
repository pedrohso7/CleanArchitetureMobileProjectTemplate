import 'package:flutter/material.dart';
import 'constants/theme/colors.dart';

class AppTheme {
  AppTheme._();
  static final ThemeData theme =
      ThemeData.light().copyWith(primaryColor: AppColors.brown);
}
