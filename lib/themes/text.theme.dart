import 'package:familia_flutter/themes/colors.dart';
import 'package:flutter/material.dart';

var headlineStyle = const TextStyle(fontWeight: FontWeight.bold);
var bodyTextStyle = const TextStyle(fontSize: 18, fontWeight: FontWeight.w500);
var miniTextStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
var appBarTitle = TextStyle(fontSize: 20, color: AppColors.greyColor);
var bodyTextBoldStyle =
    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600);

getTextTheme() {
  return TextTheme(
      headline5: headlineStyle,
      bodyText1: bodyTextStyle,
      bodyText2: miniTextStyle,
      button: bodyTextBoldStyle,
      headline6: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      subtitle1: bodyTextStyle);
}
