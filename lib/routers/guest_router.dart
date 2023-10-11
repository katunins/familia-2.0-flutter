import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import '../screens/signInScreen/sign_in_screen.dart';
import '../screens/signUpScreen/sign_up_screen.dart';
import 'app_router.gr.dart';
import 'guest_router.gr.dart';

@AutoRouterConfig()
class GuestRouter extends $GuestRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();
  @override
  final List<AutoRoute> routes = [
    AutoRoute(path: '/', page: SignInRouter.page, path: SignInScreen.pathName),
    AutoRoute(path: SignUpScreen.pathName, page: SignUpRouter.page),
  ];
}
