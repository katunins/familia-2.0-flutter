import 'package:familia_flutter/main.dart';
import 'package:familia_flutter/navigation/tabRoutes.dart';
import 'package:familia_flutter/stores/app.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../stores/navigation.store.dart';
import 'appBar.dart';
import 'bottomNavigationBar.dart';
import 'floatingButton.dart';

getScaffold({
  String? title,
  bool hideNavigationBar = false,
  bool hideUserPick = false,
  bool isAlwaysBack = false,
  Widget? customAppBarTitle,
  required Widget body,
}) =>
    Observer(
        builder: (_) => Scaffold(
            resizeToAvoidBottomInset: false,
            bottomNavigationBar: !hideNavigationBar && appStore.isAuth
                ? getBottomNavigationBar()
                : null,
            floatingActionButton: !hideNavigationBar && appStore.isAuth
                ? getFloatingButton()
                : null,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            appBar: appStore.isAuth
                ? getAppBar(
                    hideUserPic: hideUserPick,
                    customTitle: customAppBarTitle,
                    title: title,
                    leading: isAlwaysBack
                        ? IconButton(
                            onPressed: () =>
                                navigationStore.setCurrentTab(TabRoutes.home),
                            icon: const Icon(Icons.arrow_back_ios))
                        : null)
                : null,
            body: body));
