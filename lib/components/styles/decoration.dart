import 'package:flutter/material.dart';

import 'appColors.dart';

class AppDecoration {
  static BoxDecoration appBarDecoration() =>
      BoxDecoration(color:
      AppColors.white,
      // Colors.black,
          boxShadow: [
        BoxShadow(
            blurRadius: 5,
            color: AppColors.blackText.withOpacity(0.06),
            offset: const Offset(6, 11)
        )
      ]);

  static InputBorder inputBorder({double? radius, Color? borderColor}) =>OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius ??
          // AppFonts.s10
          10),
      borderSide: BorderSide(
          color: borderColor ??
              // AppColors.primaryGreen
              AppColors.greyR,
          width: 2));

  static BoxDecoration bDecorationGreyR(
          {double radius = 10, double borderWidth = 1.2, Color? borderColor }) =>
      BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: borderColor ?? AppColors.greyR , width: borderWidth));

  static BoxDecoration bDecorationPBlue(
          {double radius = 10, double borderWidth = 2}) =>
      BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: AppColors.primaryBlue, width: borderWidth));

  static BoxDecoration bDecorationWhiteShadow(
          {double radius = 10, double borderWidth = 2}) =>
      BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: AppColors.white,
          boxShadow: const [BoxShadow(color: AppColors.greyR, blurRadius: 10)]);
}
