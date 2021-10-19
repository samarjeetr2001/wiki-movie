import 'package:assignment/core/app_theme/core_theme.dart';
import 'package:flutter/cupertino.dart';

class AppTheme {
  //Text Style
  static final TextStyle textStyleTitle = TextStyle(
    fontFamily: CoreTheme.primaryFontFamily,
    fontSize: CoreTheme.fontSizeLarge,
    fontWeight: CoreTheme.fontWeightBold,
    color: CoreTheme.textColor,
  );
  static final TextStyle textStyleNormal = TextStyle(
    fontFamily: CoreTheme.primaryFontFamily,
    fontSize: CoreTheme.fontSizeNormal,
    fontWeight: CoreTheme.fontWeightRegular,
    color: CoreTheme.textColor,
  );
  static final TextStyle textStyleHeading = TextStyle(
    fontFamily: CoreTheme.primaryFontFamily,
    fontSize: CoreTheme.fontSizeMedium,
    fontWeight: CoreTheme.fontWeightRegular,
    color: CoreTheme.textColor,
  );
  static final TextStyle textStyleSmall = TextStyle(
    fontFamily: CoreTheme.primaryFontFamily,
    fontSize: CoreTheme.fontSizeSmall,
    fontWeight: CoreTheme.fontWeightRegular,
    color: CoreTheme.textColor,
  );
}
