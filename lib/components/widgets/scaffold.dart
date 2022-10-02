import 'package:flutter/material.dart';
import '../../screens/mainScreen/bottomNavigationBar.dart';
import '../../screens/mainScreen/floatingButton.dart';
import 'appBar.dart';

getScaffold({
  hideUserPick = false,
  hideNavigationBar = false,
  String? title,
  required Widget body,
}) => Scaffold(
    bottomNavigationBar: !hideNavigationBar ? getBottomNavigationBar() : null,
    floatingActionButton: !hideNavigationBar ? getFloatingButton() : null,
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    appBar: getAppBar(hideUserPic: hideUserPick, title: title),
    body: body);
