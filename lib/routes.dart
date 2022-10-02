import 'package:familia_flutter/screens/mainScreen/mainScreen.dart';
import 'package:familia_flutter/screens/profileScreen/profileScreen.dart';
import 'package:familia_flutter/screens/signInScreen/signInScreen.dart';
import 'package:familia_flutter/screens/signUpScreen/signUpScreen.dart';
import 'package:familia_flutter/screens/userScreens/setUserDataScreen.dart';
import 'package:familia_flutter/stores/navigation.store.dart';
import 'package:flutter/cupertino.dart';

final globalKeys = [
  GlobalKey<NavigatorState>(),
  GlobalKey<NavigatorState>(),
  GlobalKey<NavigatorState>(),
  GlobalKey<NavigatorState>(),
  GlobalKey<NavigatorState>(),
];

enum AppGlobalKeys {
  main,
  profile,
  album,
  pickImage,
  relatives;

  GlobalKey<NavigatorState> get globalKey => globalKeys[index];
}

getRoutes() {
  return {
    MainScreen.routeName: (_) => const MainScreen(),
    SignInScreen.routeName: (_) => const SignInScreen(),
    SignUpScreen.routeName: (_) => const SignUpScreen(),
    SetUserDataScreen.routeName: (_) => SetUserDataScreen(),
    ProfileScreen.routeName: (_) => const ProfileScreen()
  };
}