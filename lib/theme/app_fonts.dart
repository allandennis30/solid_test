import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppFonts {
  static const smallSize = 14.0;
  static const mediumSize = 16.0;
  static const titleSize = 24.0;

  static const placeholder = TextStyle(
    color: AppColors.grey400,
    fontWeight: FontWeight.normal,
    fontSize: smallSize,
  );

  static const disabledTextFormField = TextStyle(
    color: AppColors.disabledColor,
  );

  static const medium = TextStyle(
    color: AppColors.grey600,
    fontWeight: FontWeight.normal,
    fontSize: mediumSize,
  );

  static const small = TextStyle(
    color: AppColors.grey600,
    fontWeight: FontWeight.normal,
    fontSize: smallSize,
  );

  static const title = TextStyle(
    color: AppColors.grey600,
    fontWeight: FontWeight.bold,
    fontSize: titleSize,
  );
}
