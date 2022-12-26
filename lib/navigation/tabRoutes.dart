import 'navigatorPage.dart';
import 'routes.dart';

enum TabRoutes {
  guest,
  home,
  profile,
  relatives,
  notes;

  static var navigatorPages = [
    NavigatorPage(routes: GuestRoute()),
    NavigatorPage(routes: HomeRoute()),
    NavigatorPage(routes: ProfileRoute()),
    NavigatorPage(routes: RelativesRoute()),
    NavigatorPage(routes: NotesRoute()),
  ];

  get navigatorPage => navigatorPages[index];
}
