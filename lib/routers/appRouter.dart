import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:familia_flutter/screens/mainRootScreen/mainRootScreen.dart';
import 'package:familia_flutter/screens/notesScreen/noteDetailScreen.dart';
import 'package:familia_flutter/screens/notesScreen/noteListScreen.dart';
import 'package:familia_flutter/screens/profileScreen/editProfileScreen.dart';
import 'package:familia_flutter/screens/profileScreen/profileScreen.dart';
import 'package:familia_flutter/screens/relativesScreen/relativeDetailScreen.dart';
import 'package:familia_flutter/screens/relativesScreen/relativesListScreen.dart';
import 'package:familia_flutter/screens/relativesScreen/relativeNotesList.dart';
import 'package:familia_flutter/screens/treeScreen/treeScreen.dart';

import '../screens/relativesScreen/createRelativeScreen.dart';
import '../screens/relativesScreen/editRelativeScreen.dart';
import 'emptyRouter.dart';

@MaterialAutoRouter(routes: [
  AutoRoute(path: '/', page: MainRootScreen, initial: true, children: [
    AutoRoute(
        name: 'NotesRouter',
        path: 'notes',
        page: EmptyRouterPage,
        children: [
          AutoRoute(
              initial: true,
              name: 'NotesListRouter',
              path: 'notesList',
              page: NotesListScreen),
          AutoRoute(
              name: 'NoteDetailRouter',
              path: 'noteDetail',
              page: NoteDetailScreen)
        ]),
    AutoRoute(name: 'TreeRouter', path: 'tree', page: TreeScreen),
    AutoRoute(
        name: 'RelativesRouter',
        path: 'relatives',
        page: EmptyRouterPage,
        children: [
          AutoRoute(
              initial: true,
              name: 'RelativesListRouter',
              path: 'relativeList',
              page: RelativesListScreen),
          AutoRoute(
              name: 'RelativeDetailRouter',
              path: 'relativeDetail',
              page: RelativeDetailScreen),
          AutoRoute(
              name: 'CreateNewRelativeRouter',
              path: CreateRelativeScreen.pathName,
              page: CreateRelativeScreen),
          AutoRoute(
              name: 'EditRelativeRouter',
              path: EditRelativeScreen.pathName,
              page: EditRelativeScreen),
          AutoRoute(
              name: 'RelativeNotesRouter',
              path: RelativeNotesListScreen.pathName,
              page: RelativeNotesListScreen)
        ]),
    AutoRoute(
        name: 'ProfileRouter',
        path: 'profile',
        page: EmptyRouterPage,
        children: [
          AutoRoute(
              initial: true,
              name: 'ProfileScreenRouter',
              path: ProfileScreen.pathName,
              page: ProfileScreen),
          AutoRoute(
              name: 'EditProfileRouter',
              path: EditProfileScreen.pathName,
              page: EditProfileScreen),
        ]),
  ])
])
class $AppRouter {}
