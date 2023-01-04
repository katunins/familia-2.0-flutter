import 'package:auto_route/annotations.dart';
import '../screens/signInScreen/sign_in_screen.dart';
import '../screens/signUpScreen/sign_up_screen.dart';

@MaterialAutoRouter(routes: [
  AutoRoute(
      initial: true,
      page: SignInScreen,
      name: 'SignInRouter',
      path: SignInScreen.pathName),
  AutoRoute(
      path: SignUpScreen.pathName, page: SignUpScreen, name: 'SignUpRouter')
])
class $GuestRouter {}
