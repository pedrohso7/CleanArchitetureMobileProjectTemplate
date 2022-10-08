import 'package:answer_me_app/core/constants/color_constants.dart';
import 'package:flutter/material.dart';

class DefaultTheme {
  DefaultTheme._();
  static final ThemeData theme = ThemeData(
    primaryColor: ColorsConstants.PRIMARY_COLOR,
    primaryColorDark: ColorsConstants.COLOR_DARK,
    // fontFamily: 'sequel',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsConstants.PRIMARY_COLOR,
        textStyle: const TextStyle(
          fontFamily: 'sequel',
        ),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: ColorsConstants.PRIMARY_COLOR,
      selectedIconTheme: IconThemeData(color: ColorsConstants.PRIMARY_COLOR),
      selectedLabelStyle: textBold,
      unselectedItemColor: Colors.grey,
      unselectedIconTheme: IconThemeData(color: Colors.grey),
    ),
  );

  static const TextStyle textBold = TextStyle(fontWeight: FontWeight.bold);
}
