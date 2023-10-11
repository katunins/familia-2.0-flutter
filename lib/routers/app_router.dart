import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:familia_flutter/screens/mainRootScreen/main_root_screen.dart';
import 'package:familia_flutter/screens/notesScreen/create_note_screen.dart';
import 'package:familia_flutter/screens/notesScreen/note_detail_screen.dart';
import 'package:familia_flutter/screens/notesScreen/note_list_screen.dart';
import 'package:familia_flutter/screens/profileScreen/edit_profile_screen.dart';
import 'package:familia_flutter/screens/profileScreen/profile_screen.dart';
import 'package:familia_flutter/screens/relativesScreen/relative_detail_screen.dart';
import 'package:familia_flutter/screens/relativesScreen/relatives_list_screen.dart';
import 'package:familia_flutter/screens/relativesScreen/relative_notes_list.dart';
import 'package:familia_flutter/screens/treeScreen/tree_screen.dart';

import '../screens/notesScreen/edit_note_screen.dart';
import '../screens/relativesScreen/create_relative_screen.dart';
import '../screens/relativesScreen/edit_relative_screen.dart';
import 'app_router.gr.dart';
import 'empty_router.dart';

var commonRoutes = [
  AutoRoute(path: CreateRelativeScreen.pathName, page: CreateNewRelativeRouter.page),
];

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();
  @override
  final List<AutoRoute> routes = [
    AutoRoute(path: '/', page: MainRootScreen.page, children: [
      // AutoRoute(path: 'notes', page: NotesRouter.page, children: [
        // AutoRoute(path: NotesListScreen.pathName, page: NotesListRouter.page),
        // AutoRoute(path: 'noteDetail', page: NoteDetailRouter.page),
        // AutoRoute(path: CreateNoteScreen.pathName, page: CreateNoteRouter.page),
        // AutoRoute(path: EditNoteScreen.pathName, page: EditNoteRouter.page),
      // ]),
      // AutoRoute(path: 'tree', page: TreeRouter.page),
      // AutoRoute(path: 'relatives', page: RelativesRouter.page, children: [
      //   AutoRoute(path: '', path: RelativesListScreen.pathName, page: RelativesListRouter.page),
      //   AutoRoute(path: 'relativeDetail', page: RelativeDetailRouter.page),
      //   AutoRoute(path: EditRelativeScreen.pathName, page: EditRelativeRouter.page),
      //   AutoRoute(path: RelativeNotesListScreen.pathName, page: RelativeNotesRouter.page),
      //   ...commonRoutes
      // ]),
      // AutoRoute(path: 'profile', page: ProfileRouter.page, children: [
      //   AutoRoute(path: '', path: ProfileScreen.pathName, page: ProfileScreenRouter.page),
      //   AutoRoute(path: EditProfileScreen.pathName, page: EditProfileRouter.page),
      //   ...commonRoutes
      // ]),
    ]),
  ];
}

@RoutePage()
class NotesRouter extends AutoRouter {
  const NotesRouter({super.key});
}

@RoutePage()
class RelativesRouter extends AutoRouter {
  const RelativesRouter({super.key});
}

@RoutePage()
class ProfileRouter extends AutoRouter {
  const ProfileRouter({super.key});
}
