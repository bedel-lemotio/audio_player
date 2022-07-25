import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // this basically makes it so you can instantiate this class

  static const Color appThemeColor = Color(0xFF8D1EE2);
  static const Color lightAppThemeColor = Color(0xFF1AA7E1);
  static const Color greyBackgroundSurfaceColor = Color(0xFFf5f5f8);
  static const Color backgroundColor = Color(0xff303030);
  static const Color commentColor = Color.fromARGB(255, 255, 246, 196);

  static const MaterialColor appMaterialColor = MaterialColor(
    _appThemeColorPrimaryValue,
    <int, Color>{
      50: appThemeColor,
      100: appThemeColor,
      200: appThemeColor,
      300: appThemeColor,
      400: appThemeColor,
      500: Color(_appThemeColorPrimaryValue),
      600: appThemeColor,
      700: appThemeColor,
      800: appThemeColor,
      900: appThemeColor,
    },
  );
  static const int _appThemeColorPrimaryValue = 0xFF1AA7E1;

}
