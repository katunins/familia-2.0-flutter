import 'navigatorPage.dart';
import 'routes.dart';

enum TabRoutes {
  guest,
  home,
  profile;

  static var navigatorPages = [
    NavigatorPage(routes: GuestRoute()),
    NavigatorPage(routes: HomeRoute()),
    NavigatorPage(routes: ProfileRoute()),
  ];

  get navigatorPage => navigatorPages[index];
}
