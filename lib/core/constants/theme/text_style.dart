import 'package:flutter/material.dart';

import 'colors.dart';

class AppFontWeights {
  AppFontWeights._();
  static const FontWeight weak = FontWeight.w200;
  static const FontWeight normal = FontWeight.w400;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.bold;
  static const FontWeight ultraBold = FontWeight.w900;
}

class AppFontSizes {
  AppFontSizes._();
  static const double s10 = 10.0;
  static const double s12 = 12.0;
  static const double s14 = 14.0;
  static const double s16 = 16.0;
  static const double s18 = 18.0;
  static const double s20 = 20.0;
  static const double s24 = 24.0;
  static const double s32 = 32.0;
  static const double s36 = 36.0;
}

class AppTextStyles {
  AppTextStyles._();
  static const TextStyle title = TextStyle(
    color: AppColors.white,
    fontWeight: AppFontWeights.ultraBold,
    fontSize: AppFontSizes.s18,
  );

  static const TextStyle subTitle = TextStyle(
    color: AppColors.white,
    fontWeight: AppFontWeights.bold,
    fontSize: AppFontSizes.s16,
  );

  static const TextStyle defaultText = TextStyle(
    color: AppColors.white,
    fontWeight: AppFontWeights.semiBold,
    fontSize: AppFontSizes.s14,
  );

  static const TextStyle defaultTextBold = TextStyle(
    color: AppColors.white,
    fontWeight: AppFontWeights.ultraBold,
    fontSize: AppFontSizes.s14,
  );

  static const TextStyle defaultBlackText = TextStyle(
    color: AppColors.black,
    fontWeight: AppFontWeights.semiBold,
    fontSize: AppFontSizes.s14,
  );

  static const TextStyle defaultYellowText = TextStyle(
    color: AppColors.yellow,
    fontWeight: AppFontWeights.semiBold,
    fontSize: AppFontSizes.s14,
  );
}
