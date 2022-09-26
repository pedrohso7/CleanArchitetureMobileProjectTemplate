import 'package:flutter/material.dart';

class DefaultTheme {
  DefaultTheme._();
  static final ThemeData theme = ThemeData(
    primaryColor: Colors.blue,
    primaryColorDark: Colors.blueGrey,
    // fontFamily: 'sequel',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        textStyle: const TextStyle(
          fontFamily: 'sequel',
        ),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.blue,
      selectedIconTheme: IconThemeData(color: Colors.blue),
      selectedLabelStyle: textBold,
      unselectedItemColor: Colors.grey,
      unselectedIconTheme: IconThemeData(color: Colors.grey),
    ),
  );

  static const TextStyle textBold = TextStyle(fontWeight: FontWeight.bold);
}
