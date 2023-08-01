import 'package:clean_architeture_project/core/constants/color_constants.dart';
import 'package:flutter/material.dart';

class DefaultTheme {
  DefaultTheme._();
  static final ThemeData theme = ThemeData(
    primaryColor: ColorsConstants.primaryColor,
    primaryColorDark: ColorsConstants.dark,
    // fontFamily: 'sequel',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsConstants.primaryColor,
        textStyle: const TextStyle(
          fontFamily: 'sequel',
        ),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: ColorsConstants.primaryColor,
      selectedIconTheme: IconThemeData(color: ColorsConstants.primaryColor),
      selectedLabelStyle: textBold,
      unselectedItemColor: Colors.grey,
      unselectedIconTheme: IconThemeData(color: Colors.grey),
    ),
  );

  static const TextStyle textBold = TextStyle(fontWeight: FontWeight.bold);
}
