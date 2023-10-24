import 'package:flutter/material.dart';

import 'colors.dart';

class AppRadius {
  AppRadius._();
  static const double defaultCardRadius = 16;
}

class AppGradients {
  AppGradients._();
  static const Gradient cardTitleBackground = LinearGradient(
    colors: [AppColors.black, AppColors.lightBlack],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );
}
