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
import 'empty_router.dart';

const commonRoutes = <AutoRoute>[
  AutoRoute(
      name: 'CreateNewRelativeRouter',
      path: CreateRelativeScreen.pathName,
      page: CreateRelativeScreen)
];

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
              path: NotesListScreen.pathName,
              page: NotesListScreen),
          AutoRoute(
              name: 'NoteDetailRouter',
              path: 'noteDetail',
              page: NoteDetailScreen),
          AutoRoute(
              name: 'CreateNoteRouter',
              path: CreateNoteScreen.pathName,
              page: CreateNoteScreen),
          AutoRoute(
              name: 'EditNoteRouter',
              path: EditNoteScreen.pathName,
              page: EditNoteScreen),
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
              path: RelativesListScreen.pathName,
              page: RelativesListScreen),
          AutoRoute(
              name: 'RelativeDetailRouter',
              path: 'relativeDetail',
              page: RelativeDetailScreen),
          AutoRoute(
              name: 'EditRelativeRouter',
              path: EditRelativeScreen.pathName,
              page: EditRelativeScreen),
          AutoRoute(
              name: 'RelativeNotesRouter',
              path: RelativeNotesListScreen.pathName,
              page: RelativeNotesListScreen),
          ...commonRoutes,
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
          ...commonRoutes
        ]),
  ])
])
class $AppRouter {}
