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
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:flutter/material.dart' as _i16;

import '../models/note.model.dart' as _i18;
import '../models/relative.model.dart' as _i19;
import '../models/tree_element.dart' as _i17;
import '../screens/mainRootScreen/main_root_screen.dart' as _i1;
import '../screens/notesScreen/create_note_screen.dart' as _i6;
import '../screens/notesScreen/edit_note_screen.dart' as _i7;
import '../screens/notesScreen/note_detail_screen.dart' as _i5;
import '../screens/notesScreen/note_list_screen.dart' as _i4;
import '../screens/profileScreen/edit_profile_screen.dart' as _i14;
import '../screens/profileScreen/profile_screen.dart' as _i13;
import '../screens/relativesScreen/create_relative_screen.dart' as _i12;
import '../screens/relativesScreen/edit_relative_screen.dart' as _i10;
import '../screens/relativesScreen/relative_detail_screen.dart' as _i9;
import '../screens/relativesScreen/relative_notes_list.dart' as _i11;
import '../screens/relativesScreen/relatives_list_screen.dart' as _i8;
import '../screens/treeScreen/tree_screen.dart' as _i3;
import 'empty_router.dart' as _i2;

class AppRouter extends _i15.RootStackRouter {
  AppRouter([_i16.GlobalKey<_i16.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    MainRootScreenRoute.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MainRootScreen(),
      );
    },
    NotesRouter.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    TreeRouter.name: (routeData) {
      final args = routeData.argsAs<TreeRouterArgs>(
          orElse: () => const TreeRouterArgs());
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.TreeScreen(
          key: args.key,
          initialUser: args.initialUser,
        ),
      );
    },
    RelativesRouter.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    ProfileRouter.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    NotesListRouter.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.NotesListScreen(),
      );
    },
    NoteDetailRouter.name: (routeData) {
      final args = routeData.argsAs<NoteDetailRouterArgs>();
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.NoteDetailScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    CreateNoteRouter.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.CreateNoteScreen(),
      );
    },
    EditNoteRouter.name: (routeData) {
      final args = routeData.argsAs<EditNoteRouterArgs>();
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.EditNoteScreen(
          key: args.key,
          note: args.note,
        ),
      );
    },
    RelativesListRouter.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.RelativesListScreen(),
      );
    },
    RelativeDetailRouter.name: (routeData) {
      final args = routeData.argsAs<RelativeDetailRouterArgs>();
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.RelativeDetailScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    EditRelativeRouter.name: (routeData) {
      final args = routeData.argsAs<EditRelativeRouterArgs>();
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i10.EditRelativeScreen(
          key: args.key,
          relative: args.relative,
        ),
      );
    },
    RelativeNotesRouter.name: (routeData) {
      final args = routeData.argsAs<RelativeNotesRouterArgs>();
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i11.RelativeNotesListScreen(
          key: args.key,
          relativeId: args.relativeId,
        ),
      );
    },
    CreateNewRelativeRouter.name: (routeData) {
      final args = routeData.argsAs<CreateNewRelativeRouterArgs>(
          orElse: () => const CreateNewRelativeRouterArgs());
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i12.CreateRelativeScreen(
          key: args.key,
          finishCallback: args.finishCallback,
          hideBottomSheetAddRelativeButton:
              args.hideBottomSheetAddRelativeButton,
        ),
      );
    },
    ProfileScreenRouter.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.ProfileScreen(),
      );
    },
    EditProfileRouter.name: (routeData) {
      return _i15.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i14.EditProfileScreen(),
      );
    },
  };

  @override
  List<_i15.RouteConfig> get routes => [
        _i15.RouteConfig(
          MainRootScreenRoute.name,
          path: '/',
          children: [
            _i15.RouteConfig(
              NotesRouter.name,
              path: 'notes',
              parent: MainRootScreenRoute.name,
              children: [
                _i15.RouteConfig(
                  '#redirect',
                  path: '',
                  parent: NotesRouter.name,
                  redirectTo: 'notesList',
                  fullMatch: true,
                ),
                _i15.RouteConfig(
                  NotesListRouter.name,
                  path: 'notesList',
                  parent: NotesRouter.name,
                ),
                _i15.RouteConfig(
                  NoteDetailRouter.name,
                  path: 'noteDetail',
                  parent: NotesRouter.name,
                ),
                _i15.RouteConfig(
                  CreateNoteRouter.name,
                  path: 'createNote',
                  parent: NotesRouter.name,
                ),
                _i15.RouteConfig(
                  EditNoteRouter.name,
                  path: 'editNote',
                  parent: NotesRouter.name,
                ),
              ],
            ),
            _i15.RouteConfig(
              TreeRouter.name,
              path: 'tree',
              parent: MainRootScreenRoute.name,
            ),
            _i15.RouteConfig(
              RelativesRouter.name,
              path: 'relatives',
              parent: MainRootScreenRoute.name,
              children: [
                _i15.RouteConfig(
                  '#redirect',
                  path: '',
                  parent: RelativesRouter.name,
                  redirectTo: 'relativesList',
                  fullMatch: true,
                ),
                _i15.RouteConfig(
                  RelativesListRouter.name,
                  path: 'relativesList',
                  parent: RelativesRouter.name,
                ),
                _i15.RouteConfig(
                  RelativeDetailRouter.name,
                  path: 'relativeDetail',
                  parent: RelativesRouter.name,
                ),
                _i15.RouteConfig(
                  EditRelativeRouter.name,
                  path: 'editRelative',
                  parent: RelativesRouter.name,
                ),
                _i15.RouteConfig(
                  RelativeNotesRouter.name,
                  path: 'relativeNotesList',
                  parent: RelativesRouter.name,
                ),
                _i15.RouteConfig(
                  CreateNewRelativeRouter.name,
                  path: 'createRelative',
                  parent: RelativesRouter.name,
                ),
              ],
            ),
            _i15.RouteConfig(
              ProfileRouter.name,
              path: 'profile',
              parent: MainRootScreenRoute.name,
              children: [
                _i15.RouteConfig(
                  '#redirect',
                  path: '',
                  parent: ProfileRouter.name,
                  redirectTo: 'profileScreen',
                  fullMatch: true,
                ),
                _i15.RouteConfig(
                  ProfileScreenRouter.name,
                  path: 'profileScreen',
                  parent: ProfileRouter.name,
                ),
                _i15.RouteConfig(
                  EditProfileRouter.name,
                  path: 'editProfile',
                  parent: ProfileRouter.name,
                ),
                _i15.RouteConfig(
                  CreateNewRelativeRouter.name,
                  path: 'createRelative',
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
class MainRootScreenRoute extends _i15.PageRouteInfo<void> {
  const MainRootScreenRoute({List<_i15.PageRouteInfo>? children})
      : super(
          MainRootScreenRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'MainRootScreenRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class NotesRouter extends _i15.PageRouteInfo<void> {
  const NotesRouter({List<_i15.PageRouteInfo>? children})
      : super(
          NotesRouter.name,
          path: 'notes',
          initialChildren: children,
        );

  static const String name = 'NotesRouter';
}

/// generated route for
/// [_i3.TreeScreen]
class TreeRouter extends _i15.PageRouteInfo<TreeRouterArgs> {
  TreeRouter({
    _i16.Key? key,
    _i17.TreeElementModel? initialUser,
  }) : super(
          TreeRouter.name,
          path: 'tree',
          args: TreeRouterArgs(
            key: key,
            initialUser: initialUser,
          ),
        );

  static const String name = 'TreeRouter';
}

class TreeRouterArgs {
  const TreeRouterArgs({
    this.key,
    this.initialUser,
  });

  final _i16.Key? key;

  final _i17.TreeElementModel? initialUser;

  @override
  String toString() {
    return 'TreeRouterArgs{key: $key, initialUser: $initialUser}';
  }
}

/// generated route for
/// [_i2.EmptyRouterPage]
class RelativesRouter extends _i15.PageRouteInfo<void> {
  const RelativesRouter({List<_i15.PageRouteInfo>? children})
      : super(
          RelativesRouter.name,
          path: 'relatives',
          initialChildren: children,
        );

  static const String name = 'RelativesRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class ProfileRouter extends _i15.PageRouteInfo<void> {
  const ProfileRouter({List<_i15.PageRouteInfo>? children})
      : super(
          ProfileRouter.name,
          path: 'profile',
          initialChildren: children,
        );

  static const String name = 'ProfileRouter';
}

/// generated route for
/// [_i4.NotesListScreen]
class NotesListRouter extends _i15.PageRouteInfo<void> {
  const NotesListRouter()
      : super(
          NotesListRouter.name,
          path: 'notesList',
        );

  static const String name = 'NotesListRouter';
}

/// generated route for
/// [_i5.NoteDetailScreen]
class NoteDetailRouter extends _i15.PageRouteInfo<NoteDetailRouterArgs> {
  NoteDetailRouter({
    _i16.Key? key,
    required String id,
  }) : super(
          NoteDetailRouter.name,
          path: 'noteDetail',
          args: NoteDetailRouterArgs(
            key: key,
            id: id,
          ),
        );

  static const String name = 'NoteDetailRouter';
}

class NoteDetailRouterArgs {
  const NoteDetailRouterArgs({
    this.key,
    required this.id,
  });

  final _i16.Key? key;

  final String id;

  @override
  String toString() {
    return 'NoteDetailRouterArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i6.CreateNoteScreen]
class CreateNoteRouter extends _i15.PageRouteInfo<void> {
  const CreateNoteRouter()
      : super(
          CreateNoteRouter.name,
          path: 'createNote',
        );

  static const String name = 'CreateNoteRouter';
}

/// generated route for
/// [_i7.EditNoteScreen]
class EditNoteRouter extends _i15.PageRouteInfo<EditNoteRouterArgs> {
  EditNoteRouter({
    _i16.Key? key,
    required _i18.NoteModel note,
  }) : super(
          EditNoteRouter.name,
          path: 'editNote',
          args: EditNoteRouterArgs(
            key: key,
            note: note,
          ),
        );

  static const String name = 'EditNoteRouter';
}

class EditNoteRouterArgs {
  const EditNoteRouterArgs({
    this.key,
    required this.note,
  });

  final _i16.Key? key;

  final _i18.NoteModel note;

  @override
  String toString() {
    return 'EditNoteRouterArgs{key: $key, note: $note}';
  }
}

/// generated route for
/// [_i8.RelativesListScreen]
class RelativesListRouter extends _i15.PageRouteInfo<void> {
  const RelativesListRouter()
      : super(
          RelativesListRouter.name,
          path: 'relativesList',
        );

  static const String name = 'RelativesListRouter';
}

/// generated route for
/// [_i9.RelativeDetailScreen]
class RelativeDetailRouter
    extends _i15.PageRouteInfo<RelativeDetailRouterArgs> {
  RelativeDetailRouter({
    _i16.Key? key,
    required String id,
  }) : super(
          RelativeDetailRouter.name,
          path: 'relativeDetail',
          args: RelativeDetailRouterArgs(
            key: key,
            id: id,
          ),
        );

  static const String name = 'RelativeDetailRouter';
}

class RelativeDetailRouterArgs {
  const RelativeDetailRouterArgs({
    this.key,
    required this.id,
  });

  final _i16.Key? key;

  final String id;

  @override
  String toString() {
    return 'RelativeDetailRouterArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i10.EditRelativeScreen]
class EditRelativeRouter extends _i15.PageRouteInfo<EditRelativeRouterArgs> {
  EditRelativeRouter({
    _i16.Key? key,
    required _i19.RelativeModel relative,
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

  final _i16.Key? key;

  final _i19.RelativeModel relative;

  @override
  String toString() {
    return 'EditRelativeRouterArgs{key: $key, relative: $relative}';
  }
}

/// generated route for
/// [_i11.RelativeNotesListScreen]
class RelativeNotesRouter extends _i15.PageRouteInfo<RelativeNotesRouterArgs> {
  RelativeNotesRouter({
    _i16.Key? key,
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

  final _i16.Key? key;

  final String relativeId;

  @override
  String toString() {
    return 'RelativeNotesRouterArgs{key: $key, relativeId: $relativeId}';
  }
}

/// generated route for
/// [_i12.CreateRelativeScreen]
class CreateNewRelativeRouter
    extends _i15.PageRouteInfo<CreateNewRelativeRouterArgs> {
  CreateNewRelativeRouter({
    _i16.Key? key,
    dynamic Function(String?)? finishCallback,
    bool hideBottomSheetAddRelativeButton = false,
  }) : super(
          CreateNewRelativeRouter.name,
          path: 'createRelative',
          args: CreateNewRelativeRouterArgs(
            key: key,
            finishCallback: finishCallback,
            hideBottomSheetAddRelativeButton: hideBottomSheetAddRelativeButton,
          ),
        );

  static const String name = 'CreateNewRelativeRouter';
}

class CreateNewRelativeRouterArgs {
  const CreateNewRelativeRouterArgs({
    this.key,
    this.finishCallback,
    this.hideBottomSheetAddRelativeButton = false,
  });

  final _i16.Key? key;

  final dynamic Function(String?)? finishCallback;

  final bool hideBottomSheetAddRelativeButton;

  @override
  String toString() {
    return 'CreateNewRelativeRouterArgs{key: $key, finishCallback: $finishCallback, hideBottomSheetAddRelativeButton: $hideBottomSheetAddRelativeButton}';
  }
}

/// generated route for
/// [_i13.ProfileScreen]
class ProfileScreenRouter extends _i15.PageRouteInfo<void> {
  const ProfileScreenRouter()
      : super(
          ProfileScreenRouter.name,
          path: 'profileScreen',
        );

  static const String name = 'ProfileScreenRouter';
}

/// generated route for
/// [_i14.EditProfileScreen]
class EditProfileRouter extends _i15.PageRouteInfo<void> {
  const EditProfileRouter()
      : super(
          EditProfileRouter.name,
          path: 'editProfile',
        );

  static const String name = 'EditProfileRouter';
}
