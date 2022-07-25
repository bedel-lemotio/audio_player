import 'package:flutter/cupertino.dart';

import 'colors.dart';
import 'font_family.dart';


import 'package:flutter/material.dart';



class AppThemes {
  AppThemes._(); // this basically makes it so you can instantiate this class

  static final ThemeData themeData = ThemeData(
      fontFamily: AppFonts.manropeRegular,
      primaryColor: AppColors.appThemeColor,
      brightness: Brightness.dark,
      unselectedWidgetColor: Colors.white,
      primaryTextTheme: TextTheme(caption:  TextStyle(color: Colors.white))
  );

  static final CupertinoThemeData iosthemeData = CupertinoThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.appThemeColor,

  );

  static final ThemeData themeDataDark = ThemeData(
      fontFamily: AppFonts.manropeRegular,
      brightness: Brightness.dark,
      primaryColor: AppColors.appThemeColor,
      backgroundColor: Colors.black,
      unselectedWidgetColor: Colors.white,
      primaryTextTheme: const TextTheme(caption:  TextStyle(color: Colors.white,fontSize: 15)),
  );

  static final kTitleStyle = TextStyle(
    color: Colors.white,
    fontFamily: 'CM Sans Serif',
    fontSize: 26.0,
    height: 1.5,
  );

  static const headerStyle = TextStyle(
      fontSize: 35,
      fontWeight: FontWeight.w900
  );
  static const subHeaderStyle = TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w500
  );

  static final kSubtitleStyle = TextStyle(
    color: Colors.white,
    fontSize: 18.0,
    height: 1.2,
  );

}

