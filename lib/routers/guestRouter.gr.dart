// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../screens/signInScreen/signInScreen.dart' as _i1;
import '../screens/signUpScreen/signUpScreen.dart' as _i2;

class GuestRouter extends _i3.RootStackRouter {
  GuestRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    SignInScreen.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SignInScreen(),
      );
    },
    SignUpScreen.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.SignUpScreen(),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/signIn',
          fullMatch: true,
        ),
        _i3.RouteConfig(
          SignInScreen.name,
          path: '/signIn',
        ),
        _i3.RouteConfig(
          SignUpScreen.name,
          path: '/signUp',
        ),
      ];
}

/// generated route for
/// [_i1.SignInScreen]
class SignInScreen extends _i3.PageRouteInfo<void> {
  const SignInScreen()
      : super(
          SignInScreen.name,
          path: '/signIn',
        );

  static const String name = 'SignInScreen';
}

/// generated route for
/// [_i2.SignUpScreen]
class SignUpScreen extends _i3.PageRouteInfo<void> {
  const SignUpScreen()
      : super(
          SignUpScreen.name,
          path: '/signUp',
        );

  static const String name = 'SignUpScreen';
}
