// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;

import '../models/note.model.dart' as _i15;
import '../models/relative.model.dart' as _i17;
import '../screens/mainRootScreen/main_root_screen.dart' as _i1;
import '../screens/notesScreen/note_detail_screen.dart' as _i5;
import '../screens/notesScreen/note_list_screen.dart' as _i4;
import '../screens/profileScreen/edit_profile_screen.dart' as _i12;
import '../screens/profileScreen/profile_screen.dart' as _i11;
import '../screens/relativesScreen/create_relative_screen.dart' as _i8;
import '../screens/relativesScreen/edit_relative_screen.dart' as _i9;
import '../screens/relativesScreen/relative_detail_screen.dart' as _i7;
import '../screens/relativesScreen/relative_notes_list.dart' as _i10;
import '../screens/relativesScreen/relatives_list_screen.dart' as _i6;
import '../screens/treeScreen/tree_screen.dart' as _i3;
import '../stores/relative_item.store.dart' as _i16;
import 'empty_router.dart' as _i2;

class AppRouter extends _i13.RootStackRouter {
  AppRouter([_i14.GlobalKey<_i14.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    MainRootScreenRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MainRootScreen(),
      );
    },
    NotesRouter.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    TreeRouter.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.TreeScreen(),
      );
    },
    RelativesRouter.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    ProfileRouter.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    NotesListRouter.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.NotesListScreen(),
      );
    },
    NoteDetailRouter.name: (routeData) {
      final args = routeData.argsAs<NoteDetailRouterArgs>();
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.NoteDetailScreen(
          key: args.key,
          note: args.note,
        ),
      );
    },
    RelativesListRouter.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.RelativesListScreen(),
      );
    },
    RelativeDetailRouter.name: (routeData) {
      final args = routeData.argsAs<RelativeDetailRouterArgs>();
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.RelativeDetailScreen(
          key: args.key,
          relative: args.relative,
        ),
      );
    },
    CreateNewRelativeRouter.name: (routeData) {
      final args = routeData.argsAs<CreateNewRelativeRouterArgs>(
          orElse: () => const CreateNewRelativeRouterArgs());
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.CreateRelativeScreen(key: args.key),
      );
    },
    EditRelativeRouter.name: (routeData) {
      final args = routeData.argsAs<EditRelativeRouterArgs>();
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.EditRelativeScreen(
          key: args.key,
          relative: args.relative,
        ),
      );
    },
    RelativeNotesRouter.name: (routeData) {
      final args = routeData.argsAs<RelativeNotesRouterArgs>();
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i10.RelativeNotesListScreen(
          key: args.key,
          relativeId: args.relativeId,
        ),
      );
    },
    ProfileScreenRouter.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.ProfileScreen(),
      );
    },
    EditProfileRouter.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.EditProfileScreen(),
      );
    },
  };

  @override
  List<_i13.RouteConfig> get routes => [
        _i13.RouteConfig(
          MainRootScreenRoute.name,
          path: '/',
          children: [
            _i13.RouteConfig(
              NotesRouter.name,
              path: 'notes',
              parent: MainRootScreenRoute.name,
              children: [
                _i13.RouteConfig(
                  '#redirect',
                  path: '',
                  parent: NotesRouter.name,
                  redirectTo: 'notesList',
                  fullMatch: true,
                ),
                _i13.RouteConfig(
                  NotesListRouter.name,
                  path: 'notesList',
                  parent: NotesRouter.name,
                ),
                _i13.RouteConfig(
                  NoteDetailRouter.name,
                  path: 'noteDetail',
                  parent: NotesRouter.name,
                ),
              ],
            ),
            _i13.RouteConfig(
              TreeRouter.name,
              path: 'tree',
              parent: MainRootScreenRoute.name,
            ),
            _i13.RouteConfig(
              RelativesRouter.name,
              path: 'relatives',
              parent: MainRootScreenRoute.name,
              children: [
                _i13.RouteConfig(
                  '#redirect',
                  path: '',
                  parent: RelativesRouter.name,
                  redirectTo: 'relativeList',
                  fullMatch: true,
                ),
                _i13.RouteConfig(
                  RelativesListRouter.name,
                  path: 'relativeList',
                  parent: RelativesRouter.name,
                ),
                _i13.RouteConfig(
                  RelativeDetailRouter.name,
                  path: 'relativeDetail',
                  parent: RelativesRouter.name,
                ),
                _i13.RouteConfig(
                  CreateNewRelativeRouter.name,
                  path: 'createRelative',
                  parent: RelativesRouter.name,
                ),
                _i13.RouteConfig(
                  EditRelativeRouter.name,
                  path: 'editRelative',
                  parent: RelativesRouter.name,
                ),
                _i13.RouteConfig(
                  RelativeNotesRouter.name,
                  path: 'relativeNotesList',
                  parent: RelativesRouter.name,
                ),
              ],
            ),
            _i13.RouteConfig(
              ProfileRouter.name,
              path: 'profile',
              parent: MainRootScreenRoute.name,
              children: [
                _i13.RouteConfig(
                  '#redirect',
                  path: '',
                  parent: ProfileRouter.name,
                  redirectTo: 'profileScreen',
                  fullMatch: true,
                ),
                _i13.RouteConfig(
                  ProfileScreenRouter.name,
                  path: 'profileScreen',
                  parent: ProfileRouter.name,
                ),
                _i13.RouteConfig(
                  EditProfileRouter.name,
                  path: 'editProfile',
                  parent: ProfileRouter.name,
                ),
              ],
            ),
          ],
        )
      ];
}

/// generated route for
/// [_i1.MainRootScreen]
class MainRootScreenRoute extends _i13.PageRouteInfo<void> {
  const MainRootScreenRoute({List<_i13.PageRouteInfo>? children})
      : super(
          MainRootScreenRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'MainRootScreenRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class NotesRouter extends _i13.PageRouteInfo<void> {
  const NotesRouter({List<_i13.PageRouteInfo>? children})
      : super(
          NotesRouter.name,
          path: 'notes',
          initialChildren: children,
        );

  static const String name = 'NotesRouter';
}

/// generated route for
/// [_i3.TreeScreen]
class TreeRouter extends _i13.PageRouteInfo<void> {
  const TreeRouter()
      : super(
          TreeRouter.name,
          path: 'tree',
        );

  static const String name = 'TreeRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class RelativesRouter extends _i13.PageRouteInfo<void> {
  const RelativesRouter({List<_i13.PageRouteInfo>? children})
      : super(
          RelativesRouter.name,
          path: 'relatives',
          initialChildren: children,
        );

  static const String name = 'RelativesRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class ProfileRouter extends _i13.PageRouteInfo<void> {
  const ProfileRouter({List<_i13.PageRouteInfo>? children})
      : super(
          ProfileRouter.name,
          path: 'profile',
          initialChildren: children,
        );

  static const String name = 'ProfileRouter';
}

/// generated route for
/// [_i4.NotesListScreen]
class NotesListRouter extends _i13.PageRouteInfo<void> {
  const NotesListRouter()
      : super(
          NotesListRouter.name,
          path: 'notesList',
        );

  static const String name = 'NotesListRouter';
}

/// generated route for
/// [_i5.NoteDetailScreen]
class NoteDetailRouter extends _i13.PageRouteInfo<NoteDetailRouterArgs> {
  NoteDetailRouter({
    _i14.Key? key,
    required _i15.NoteModel note,
  }) : super(
          NoteDetailRouter.name,
          path: 'noteDetail',
          args: NoteDetailRouterArgs(
            key: key,
            note: note,
          ),
        );

  static const String name = 'NoteDetailRouter';
}

class NoteDetailRouterArgs {
  const NoteDetailRouterArgs({
    this.key,
    required this.note,
  });

  final _i14.Key? key;

  final _i15.NoteModel note;

  @override
  String toString() {
    return 'NoteDetailRouterArgs{key: $key, note: $note}';
  }
}

/// generated route for
/// [_i6.RelativesListScreen]
class RelativesListRouter extends _i13.PageRouteInfo<void> {
  const RelativesListRouter()
      : super(
          RelativesListRouter.name,
          path: 'relativeList',
        );

  static const String name = 'RelativesListRouter';
}

/// generated route for
/// [_i7.RelativeDetailScreen]
class RelativeDetailRouter
    extends _i13.PageRouteInfo<RelativeDetailRouterArgs> {
  RelativeDetailRouter({
    _i14.Key? key,
    required _i16.RelativeItemStore relative,
  }) : super(
          RelativeDetailRouter.name,
          path: 'relativeDetail',
          args: RelativeDetailRouterArgs(
            key: key,
            relative: relative,
          ),
        );

  static const String name = 'RelativeDetailRouter';
}

class RelativeDetailRouterArgs {
  const RelativeDetailRouterArgs({
    this.key,
    required this.relative,
  });

  final _i14.Key? key;

  final _i16.RelativeItemStore relative;

  @override
  String toString() {
    return 'RelativeDetailRouterArgs{key: $key, relative: $relative}';
  }
}

/// generated route for
/// [_i8.CreateRelativeScreen]
class CreateNewRelativeRouter
    extends _i13.PageRouteInfo<CreateNewRelativeRouterArgs> {
  CreateNewRelativeRouter({_i14.Key? key})
      : super(
          CreateNewRelativeRouter.name,
          path: 'createRelative',
          args: CreateNewRelativeRouterArgs(key: key),
        );

  static const String name = 'CreateNewRelativeRouter';
}

class CreateNewRelativeRouterArgs {
  const CreateNewRelativeRouterArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'CreateNewRelativeRouterArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.EditRelativeScreen]
class EditRelativeRouter extends _i13.PageRouteInfo<EditRelativeRouterArgs> {
  EditRelativeRouter({
    _i14.Key? key,
    required _i17.RelativeModel relative,
  }) : super(
          EditRelativeRouter.name,
          path: 'editRelative',
          args: EditRelativeRouterArgs(
            key: key,
            relative: relative,
          ),
        );

  static const String name = 'EditRelativeRouter';
}

class EditRelativeRouterArgs {
  const EditRelativeRouterArgs({
    this.key,
    required this.relative,
  });

  final _i14.Key? key;

  final _i17.RelativeModel relative;

  @override
  String toString() {
    return 'EditRelativeRouterArgs{key: $key, relative: $relative}';
  }
}

/// generated route for
/// [_i10.RelativeNotesListScreen]
class RelativeNotesRouter extends _i13.PageRouteInfo<RelativeNotesRouterArgs> {
  RelativeNotesRouter({
    _i14.Key? key,
    required String relativeId,
  }) : super(
          RelativeNotesRouter.name,
          path: 'relativeNotesList',
          args: RelativeNotesRouterArgs(
            key: key,
            relativeId: relativeId,
          ),
        );

  static const String name = 'RelativeNotesRouter';
}

class RelativeNotesRouterArgs {
  const RelativeNotesRouterArgs({
    this.key,
    required this.relativeId,
  });

  final _i14.Key? key;

  final String relativeId;

  @override
  String toString() {
    return 'RelativeNotesRouterArgs{key: $key, relativeId: $relativeId}';
  }
}

/// generated route for
/// [_i11.ProfileScreen]
class ProfileScreenRouter extends _i13.PageRouteInfo<void> {
  const ProfileScreenRouter()
      : super(
          ProfileScreenRouter.name,
          path: 'profileScreen',
        );

  static const String name = 'ProfileScreenRouter';
}

/// generated route for
/// [_i12.EditProfileScreen]
class EditProfileRouter extends _i13.PageRouteInfo<void> {
  const EditProfileRouter()
      : super(
          EditProfileRouter.name,
          path: 'editProfile',
        );

  static const String name = 'EditProfileRouter';
}
