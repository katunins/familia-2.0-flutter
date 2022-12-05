import 'package:flutter/material.dart';

var headlineStyle = const TextStyle(fontWeight: FontWeight.bold);
var bodyTextStyle = const TextStyle(fontSize: 18, fontWeight: FontWeight.w500);
var miniTextStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
var bodyTextBoldStyle =
    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600);

getTextTheme() {
  return TextTheme(
      headline5: headlineStyle,
      bodyText1: bodyTextStyle,
      bodyText2: miniTextStyle,
      button: bodyTextBoldStyle,
      subtitle1: bodyTextStyle);
}
