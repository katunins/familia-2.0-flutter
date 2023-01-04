import 'package:auto_route/annotations.dart';
import '../screens/signInScreen/signInScreen.dart';
import '../screens/signUpScreen/signUpScreen.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: [
  AutoRoute(initial: true, path: '/signIn', page: SignInScreen),
  AutoRoute(path: '/signUp', page: SignUpScreen)
])
class $GuestRouter {}
