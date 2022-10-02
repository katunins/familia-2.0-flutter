import 'package:familia_flutter/themes/button.theme.dart';
import 'package:familia_flutter/themes/text.theme.dart';
import 'package:flutter/material.dart';

import 'colors.dart';
import 'form.theme.dart';

getThemeData(BuildContext context){
  return ThemeData(
      textTheme: getTextTheme(),
      colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: AppColors.primaryColor
      ),
      elevatedButtonTheme: getElevatedButtonThemeData(),
      fontFamily: 'Raleway',
      inputDecorationTheme: getInputDecorationTheme(),
    appBarTheme: Theme.of(context).appBarTheme.copyWith(
      backgroundColor: AppColors.primaryColor,
      shadowColor: Colors.transparent
    )
  );
}