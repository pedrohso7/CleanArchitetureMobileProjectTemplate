import 'package:flutter/material.dart';

import '../constants/theme/colors.dart';

class DefaultTheme {
  DefaultTheme._();
  static final ThemeData theme = ThemeData(
    primaryColor: AppColors.yellow,
    primaryColorDark: AppColors.black,
    // fontFamily: 'sequel',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.yellow,
        textStyle: const TextStyle(
          fontFamily: 'sequel',
        ),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.yellow,
      selectedIconTheme: IconThemeData(color: AppColors.yellow),
      selectedLabelStyle: textBold,
      unselectedItemColor: Colors.grey,
      unselectedIconTheme: IconThemeData(color: Colors.grey),
    ),
  );

  static const TextStyle textBold = TextStyle(fontWeight: FontWeight.bold);
}
