import 'package:familia_flutter/screens/mainScreen/mainScreen.dart';
import 'package:familia_flutter/screens/notesScreen/noteDetailScreen.dart';
import 'package:familia_flutter/screens/profileScreen/profileScreen.dart';
import 'package:familia_flutter/screens/relativesScreen/relativesListScreen.dart';
import 'package:familia_flutter/screens/signInScreen/signInScreen.dart';
import 'package:familia_flutter/screens/signUpScreen/signUpScreen.dart';
import 'package:flutter/cupertino.dart';

import '../screens/notesScreen/noteListScreen.dart';

abstract class Routes {
  Route<dynamic> getRoute(RouteSettings settings);
}

class GuestRoute implements Routes {
  @override
  Route getRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case SignInScreen.routeName:
        return CupertinoPageRoute(builder: (_) => const SignInScreen());
      case SignUpScreen.routeName:
        return CupertinoPageRoute(builder: (_) => const SignUpScreen());
      default:
        return CupertinoPageRoute(builder: (_) => Container());
    }
  }
}

class HomeRoute implements Routes {
  @override
  Route getRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case MainScreen.routeName:
        return CupertinoPageRoute(builder: (_) => const MainScreen());
      default:
        return CupertinoPageRoute(builder: (_) => Container());
    }
  }
}

class ProfileRoute implements Routes {
  @override
  Route getRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case ProfileScreen.routeName:
        return CupertinoPageRoute(builder: (_) => const ProfileScreen());
      default:
        return CupertinoPageRoute(builder: (_) => Container());
    }
  }
}

class RelativesRoute implements Routes {
  @override
  Route getRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case RelativesListScreen.routeName:
        return CupertinoPageRoute(builder: (_) => const RelativesListScreen());
      default:
        return CupertinoPageRoute(builder: (_) => Container());
    }
  }
}

class NotesRoute implements Routes {
  @override
  Route getRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case NotesListScreen.routeName:
        return CupertinoPageRoute(builder: (_) => const NotesListScreen());
      default:
        return CupertinoPageRoute(builder: (_) => const NotesListScreen());
    }
  }
}