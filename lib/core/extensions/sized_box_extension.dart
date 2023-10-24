import 'package:flutter/material.dart';

import '../constants/theme/sizes.dart';

class VerticalSpace extends SizedBox {
  static const s4 = VerticalSpace(AppSizes.s4);
  static const s8 = VerticalSpace(AppSizes.s8);
  static const s16 = VerticalSpace(AppSizes.s16);
  static const s24 = VerticalSpace(AppSizes.s24);
  static const s32 = VerticalSpace(AppSizes.s32);
  static const s40 = VerticalSpace(AppSizes.s40);
  static const s48 = VerticalSpace(AppSizes.s48);
  static const s224 = VerticalSpace(AppSizes.s224);

  const VerticalSpace(double space, {super.key}) : super(height: space);
}

class HorizontalSpace extends SizedBox {
  static const s4 = HorizontalSpace(AppSizes.s4);
  static const s8 = HorizontalSpace(AppSizes.s8);
  static const s16 = HorizontalSpace(AppSizes.s16);
  static const s24 = HorizontalSpace(AppSizes.s24);
  static const s32 = HorizontalSpace(AppSizes.s32);

  const HorizontalSpace(double space, {super.key}) : super(width: space);
}
