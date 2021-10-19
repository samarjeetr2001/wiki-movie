import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class CoreTheme {
  //colors
  static const Color backGroundColor = Color(0xff17082A);
  static const Color primaryColor = Color(0xff210F37);
  static const Color secondaryColor = Color(0xfff79E44);
  static const Color textColor = Color(0xffffffff);
  static const Color colorBrownShade = Color(0xff815325);

  //font
  //family
  // static const String primaryFontFamily = 'Montserrat';
  static final String primaryFontFamily = GoogleFonts.montserrat().fontFamily!;
  //weight
  static const FontWeight fontWeightRegular = FontWeight.normal;
  static const FontWeight fontWeightBold = FontWeight.bold;
  //size
  static const double fontSizeSmall = 16.0;
  static const double fontSizeNormal = 20.0;
  static const double fontSizeMedium = 24.0;
  static const double fontSizeLarge = 32.0;

  //space
  static const double spaceSizeSmall = 10.0;
  static const double spaceSizeMedium = 20.0;
  static const double spaceSizeLarge = 30.0;
  static const double spaceSizeExtremeLarge = 40.0;
}
