import 'navigatorPage.dart';
import 'routes.dart';

enum TabRoutes {
  guest,
  home,
  profile,
  relatives;

  static var navigatorPages = [
    NavigatorPage(routes: GuestRoute()),
    NavigatorPage(routes: HomeRoute()),
    NavigatorPage(routes: ProfileRoute()),
    NavigatorPage(routes: RelativesRoute()),
  ];

  get navigatorPage => navigatorPages[index];
}
