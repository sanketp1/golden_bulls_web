import 'package:flutter/widgets.dart';

class SizeUtils {
  //getting the width of the screen
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  //getting the height of the screen
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
