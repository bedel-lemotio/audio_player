

import 'package:flutter/cupertino.dart';

class Dimens {
  Dimens._();

  //for all screens
  static const double horizontal_padding = 12.0;
  static const double vertical_padding = 12.0;

  static double height (context) {
    return MediaQuery.of(context).size.height;
  }

  static double width (context) {
    return MediaQuery.of(context).size.width;
  }
}