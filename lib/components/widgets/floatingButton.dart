import 'package:familia_flutter/main.dart';
import 'package:familia_flutter/navigation/tabRoutes.dart';
import 'package:familia_flutter/stores/navigation.store.dart';
import 'package:flutter/material.dart';

import '../../screens/userScreens/setUserDataScreen.dart';
import '../../stores/relatives.store.dart';
import '../../stores/user.store.dart';
import '../../themes/colors.dart';

getFloatingButton() {
  Function()? onPressed;
  final context = navigationStore.currentKey.currentContext;

  switch (navigationStore.currentAppRoute) {
    case TabRoutes.relatives:
      onPressed = () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => SetUserDataScreen(
                  title: 'Новый родственник',
                  isNewUser: true,
                  isRelativeMode: true,
                  imageSubmit: relativesStore.updateUserPic,
                  dataSaveFunction: relativesStore.newUser,
                  afterSubmit: Navigator.of(context).pop,
                )));
      };
      break;
    default:
      onPressed = () {};
  }

  return FloatingActionButton(
    backgroundColor: AppColors.primaryColor,
    onPressed: onPressed,
    child: const Icon(Icons.add, size: 30),
  );
}
