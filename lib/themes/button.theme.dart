import 'package:flutter/material.dart';

getElevatedButtonThemeData(){
  return ElevatedButtonThemeData(
    style:  ElevatedButton.styleFrom(
      minimumSize: const Size.fromHeight(60),
    )
  );
}