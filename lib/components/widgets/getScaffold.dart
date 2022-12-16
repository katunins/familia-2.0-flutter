import 'dart:async';

import 'package:familia_flutter/stores/app.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../appBarSearch.dart';
import '../homeIcon.dart';
import 'appBar.dart';
import 'backIcon.dart';
import 'bottomNavigationBar.dart';
import 'floatingButton.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold(
      {Key? key,
      this.title,
      this.setSearch,
      required this.body,
      this.hideNavigationBar = false,
      this.isUserPick = false,
      this.isBackButton = false,
      this.isHomeButton = false})
      : super(key: key);

  final String? title;
  final Function(String)? setSearch;
  final bool hideNavigationBar;
  final bool isUserPick;
  final bool isBackButton;
  final bool isHomeButton;
  final Widget body;

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  var hideLeading = false;
  late StreamSubscription<bool> keyboardSubscription;

  setHideLeading(bool val){
    setState(() {
      hideLeading = val;
    });
  }

  @override
  void initState() {
    var keyboardVisibilityController = KeyboardVisibilityController();
    keyboardSubscription = keyboardVisibilityController.onChange.listen(setHideLeading);
    super.initState();
  }

  @override
  void dispose() {
    keyboardSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var leading = widget.isBackButton
        ? getBackIcon
        : (widget.isHomeButton ? getHomeIcon : null);

    var customTitle = widget.setSearch != null
        ? SearchInput(
            initialValue: '',
            onChange: widget.setSearch!,
          )
        : null;

    return Observer(builder: (_) {
      return Scaffold(
          resizeToAvoidBottomInset: false,
          bottomNavigationBar: !widget.hideNavigationBar && appStore.isAuth
              ? getBottomNavigationBar()
              : null,
          floatingActionButton: !widget.hideNavigationBar && appStore.isAuth
              ? getFloatingButton()
              : null,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          appBar: appStore.isAuth
              ? getAppBar(
                  isUserPick: widget.isUserPick,
                  customTitle: customTitle,
                  title: widget.title,
                  leading: hideLeading ? null : leading)
              : null,
          body: widget.body);
    });
  }
}
