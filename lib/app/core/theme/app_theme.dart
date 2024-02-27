import 'package:flutter/material.dart';
import 'package:savoniq/app/core/globals/globals.dart';

class AppThemes {
  static final ThemeData themeData = ThemeData(
    fontFamily: 'Fontspring-DEMO-visbycf',
    colorScheme: ColorScheme(
      primary: CustomColors.primary,
      surface: CustomColors.greybackground, //any white color
      background: CustomColors.background,
      error: Colors.red[700]!,
      onPrimary: CustomColors.white,
      brightness: Brightness.dark,
      secondary: CustomColors.background,
      onSecondary: CustomColors.greybackground,
      onError: Colors.red,
      onBackground: CustomColors.background,
      onSurface: CustomColors.white,
    ),
  );
}
