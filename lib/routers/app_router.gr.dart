// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i17;
import 'package:familia_flutter/models/note.model.dart' as _i21;
import 'package:familia_flutter/models/relative.model.dart' as _i20;
import 'package:familia_flutter/routers/app_router.dart' as _i1;
import 'package:familia_flutter/screens/mainRootScreen/main_root_screen.dart'
    as _i8;
import 'package:familia_flutter/screens/notesScreen/create_note_screen.dart'
    as _i14;
import 'package:familia_flutter/screens/notesScreen/edit_note_screen.dart'
    as _i13;
import 'package:familia_flutter/screens/notesScreen/note_detail_screen.dart'
    as _i16;
import 'package:familia_flutter/screens/notesScreen/note_list_screen.dart'
    as _i15;
import 'package:familia_flutter/screens/profileScreen/edit_profile_screen.dart'
    as _i12;
import 'package:familia_flutter/screens/profileScreen/profile_screen.dart'
    as _i11;
import 'package:familia_flutter/screens/relativesScreen/create_relative_screen.dart'
    as _i4;
import 'package:familia_flutter/screens/relativesScreen/edit_relative_screen.dart'
    as _i6;
import 'package:familia_flutter/screens/relativesScreen/relative_detail_screen.dart'
    as _i2;
import 'package:familia_flutter/screens/relativesScreen/relative_notes_list.dart'
    as _i3;
import 'package:familia_flutter/screens/relativesScreen/relatives_list_screen.dart'
    as _i5;
import 'package:familia_flutter/screens/signInScreen/sign_in_screen.dart'
    as _i10;
import 'package:familia_flutter/screens/signUpScreen/sign_up_screen.dart'
    as _i7;
import 'package:familia_flutter/screens/treeScreen/tree_screen.dart' as _i9;
import 'package:flutter/cupertino.dart' as _i19;
import 'package:flutter/material.dart' as _i18;

abstract class $AppRouter extends _i17.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i17.PageFactory> pagesMap = {
    NotesRouter.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.NotesRouter(),
      );
    },
    RelativesRouter.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.RelativesRouter(),
      );
    },
    ProfileRouter.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ProfileRouter(),
      );
    },
    RelativeDetailRouter.name: (routeData) {
      final args = routeData.argsAs<RelativeDetailRouterArgs>();
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.RelativeDetailScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    RelativeNotesRouter.name: (routeData) {
      final args = routeData.argsAs<RelativeNotesRouterArgs>();
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.RelativeNotesListScreen(
          key: args.key,
          relativeId: args.relativeId,
        ),
      );
    },
    CreateNewRelativeRouter.name: (routeData) {
      final args = routeData.argsAs<CreateNewRelativeRouterArgs>(
          orElse: () => const CreateNewRelativeRouterArgs());
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.CreateRelativeScreen(
          key: args.key,
          finishCallback: args.finishCallback,
          hideBottomSheetAddRelativeButton:
              args.hideBottomSheetAddRelativeButton,
        ),
      );
    },
    RelativesListRouter.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.RelativesListScreen(),
      );
    },
    EditRelativeRouter.name: (routeData) {
      final args = routeData.argsAs<EditRelativeRouterArgs>();
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.EditRelativeScreen(
          key: args.key,
          relative: args.relative,
        ),
      );
    },
    SignUpRouter.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SignUpScreen(),
      );
    },
    MainRootRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.MainRootScreen(),
      );
    },
    TreeRouter.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.TreeScreen(),
      );
    },
    SignInRouter.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.SignInScreen(),
      );
    },
    ProfileScreenRouter.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.ProfileScreen(),
      );
    },
    EditProfileRouter.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.EditProfileScreen(),
      );
    },
    EditNoteRouter.name: (routeData) {
      final args = routeData.argsAs<EditNoteRouterArgs>();
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.EditNoteScreen(
          key: args.key,
          note: args.note,
        ),
      );
    },
    CreateNoteRouter.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.CreateNoteScreen(),
      );
    },
    NotesListRouter.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.NotesListScreen(),
      );
    },
    NoteDetailRouter.name: (routeData) {
      final args = routeData.argsAs<NoteDetailRouterArgs>();
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.NoteDetailScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.NotesRouter]
class NotesRouter extends _i17.PageRouteInfo<void> {
  const NotesRouter({List<_i17.PageRouteInfo>? children})
      : super(
          NotesRouter.name,
          initialChildren: children,
        );

  static const String name = 'NotesRouter';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i1.RelativesRouter]
class RelativesRouter extends _i17.PageRouteInfo<void> {
  const RelativesRouter({List<_i17.PageRouteInfo>? children})
      : super(
          RelativesRouter.name,
          initialChildren: children,
        );

  static const String name = 'RelativesRouter';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i1.ProfileRouter]
class ProfileRouter extends _i17.PageRouteInfo<void> {
  const ProfileRouter({List<_i17.PageRouteInfo>? children})
      : super(
          ProfileRouter.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRouter';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i2.RelativeDetailScreen]
class RelativeDetailRouter
    extends _i17.PageRouteInfo<RelativeDetailRouterArgs> {
  RelativeDetailRouter({
    _i18.Key? key,
    required String id,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          RelativeDetailRouter.name,
          args: RelativeDetailRouterArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'RelativeDetailRouter';

  static const _i17.PageInfo<RelativeDetailRouterArgs> page =
      _i17.PageInfo<RelativeDetailRouterArgs>(name);
}

class RelativeDetailRouterArgs {
  const RelativeDetailRouterArgs({
    this.key,
    required this.id,
  });

  final _i18.Key? key;

  final String id;

  @override
  String toString() {
    return 'RelativeDetailRouterArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i3.RelativeNotesListScreen]
class RelativeNotesRouter extends _i17.PageRouteInfo<RelativeNotesRouterArgs> {
  RelativeNotesRouter({
    _i19.Key? key,
    required String relativeId,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          RelativeNotesRouter.name,
          args: RelativeNotesRouterArgs(
            key: key,
            relativeId: relativeId,
          ),
          initialChildren: children,
        );

  static const String name = 'RelativeNotesRouter';

  static const _i17.PageInfo<RelativeNotesRouterArgs> page =
      _i17.PageInfo<RelativeNotesRouterArgs>(name);
}

class RelativeNotesRouterArgs {
  const RelativeNotesRouterArgs({
    this.key,
    required this.relativeId,
  });

  final _i19.Key? key;

  final String relativeId;

  @override
  String toString() {
    return 'RelativeNotesRouterArgs{key: $key, relativeId: $relativeId}';
  }
}

/// generated route for
/// [_i4.CreateRelativeScreen]
class CreateNewRelativeRouter
    extends _i17.PageRouteInfo<CreateNewRelativeRouterArgs> {
  CreateNewRelativeRouter({
    _i19.Key? key,
    dynamic Function(String?)? finishCallback,
    bool hideBottomSheetAddRelativeButton = false,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          CreateNewRelativeRouter.name,
          args: CreateNewRelativeRouterArgs(
            key: key,
            finishCallback: finishCallback,
            hideBottomSheetAddRelativeButton: hideBottomSheetAddRelativeButton,
          ),
          initialChildren: children,
        );

  static const String name = 'CreateNewRelativeRouter';

  static const _i17.PageInfo<CreateNewRelativeRouterArgs> page =
      _i17.PageInfo<CreateNewRelativeRouterArgs>(name);
}

class CreateNewRelativeRouterArgs {
  const CreateNewRelativeRouterArgs({
    this.key,
    this.finishCallback,
    this.hideBottomSheetAddRelativeButton = false,
  });

  final _i19.Key? key;

  final dynamic Function(String?)? finishCallback;

  final bool hideBottomSheetAddRelativeButton;

  @override
  String toString() {
    return 'CreateNewRelativeRouterArgs{key: $key, finishCallback: $finishCallback, hideBottomSheetAddRelativeButton: $hideBottomSheetAddRelativeButton}';
  }
}

/// generated route for
/// [_i5.RelativesListScreen]
class RelativesListRouter extends _i17.PageRouteInfo<void> {
  const RelativesListRouter({List<_i17.PageRouteInfo>? children})
      : super(
          RelativesListRouter.name,
          initialChildren: children,
        );

  static const String name = 'RelativesListRouter';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i6.EditRelativeScreen]
class EditRelativeRouter extends _i17.PageRouteInfo<EditRelativeRouterArgs> {
  EditRelativeRouter({
    _i19.Key? key,
    required _i20.RelativeModel relative,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          EditRelativeRouter.name,
          args: EditRelativeRouterArgs(
            key: key,
            relative: relative,
          ),
          initialChildren: children,
        );

  static const String name = 'EditRelativeRouter';

  static const _i17.PageInfo<EditRelativeRouterArgs> page =
      _i17.PageInfo<EditRelativeRouterArgs>(name);
}

class EditRelativeRouterArgs {
  const EditRelativeRouterArgs({
    this.key,
    required this.relative,
  });

  final _i19.Key? key;

  final _i20.RelativeModel relative;

  @override
  String toString() {
    return 'EditRelativeRouterArgs{key: $key, relative: $relative}';
  }
}

/// generated route for
/// [_i7.SignUpScreen]
class SignUpRouter extends _i17.PageRouteInfo<void> {
  const SignUpRouter({List<_i17.PageRouteInfo>? children})
      : super(
          SignUpRouter.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRouter';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i8.MainRootScreen]
class MainRootRoute extends _i17.PageRouteInfo<void> {
  const MainRootRoute({List<_i17.PageRouteInfo>? children})
      : super(
          MainRootRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRootRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i9.TreeScreen]
class TreeRouter extends _i17.PageRouteInfo<void> {
  const TreeRouter({List<_i17.PageRouteInfo>? children})
      : super(
          TreeRouter.name,
          initialChildren: children,
        );

  static const String name = 'TreeRouter';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i10.SignInScreen]
class SignInRouter extends _i17.PageRouteInfo<void> {
  const SignInRouter({List<_i17.PageRouteInfo>? children})
      : super(
          SignInRouter.name,
          initialChildren: children,
        );

  static const String name = 'SignInRouter';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i11.ProfileScreen]
class ProfileScreenRouter extends _i17.PageRouteInfo<void> {
  const ProfileScreenRouter({List<_i17.PageRouteInfo>? children})
      : super(
          ProfileScreenRouter.name,
          initialChildren: children,
        );

  static const String name = 'ProfileScreenRouter';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i12.EditProfileScreen]
class EditProfileRouter extends _i17.PageRouteInfo<void> {
  const EditProfileRouter({List<_i17.PageRouteInfo>? children})
      : super(
          EditProfileRouter.name,
          initialChildren: children,
        );

  static const String name = 'EditProfileRouter';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i13.EditNoteScreen]
class EditNoteRouter extends _i17.PageRouteInfo<EditNoteRouterArgs> {
  EditNoteRouter({
    _i19.Key? key,
    required _i21.NoteModel note,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          EditNoteRouter.name,
          args: EditNoteRouterArgs(
            key: key,
            note: note,
          ),
          initialChildren: children,
        );

  static const String name = 'EditNoteRouter';

  static const _i17.PageInfo<EditNoteRouterArgs> page =
      _i17.PageInfo<EditNoteRouterArgs>(name);
}

class EditNoteRouterArgs {
  const EditNoteRouterArgs({
    this.key,
    required this.note,
  });

  final _i19.Key? key;

  final _i21.NoteModel note;

  @override
  String toString() {
    return 'EditNoteRouterArgs{key: $key, note: $note}';
  }
}

/// generated route for
/// [_i14.CreateNoteScreen]
class CreateNoteRouter extends _i17.PageRouteInfo<void> {
  const CreateNoteRouter({List<_i17.PageRouteInfo>? children})
      : super(
          CreateNoteRouter.name,
          initialChildren: children,
        );

  static const String name = 'CreateNoteRouter';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i15.NotesListScreen]
class NotesListRouter extends _i17.PageRouteInfo<void> {
  const NotesListRouter({List<_i17.PageRouteInfo>? children})
      : super(
          NotesListRouter.name,
          initialChildren: children,
        );

  static const String name = 'NotesListRouter';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i16.NoteDetailScreen]
class NoteDetailRouter extends _i17.PageRouteInfo<NoteDetailRouterArgs> {
  NoteDetailRouter({
    _i19.Key? key,
    required String id,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          NoteDetailRouter.name,
          args: NoteDetailRouterArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'NoteDetailRouter';

  static const _i17.PageInfo<NoteDetailRouterArgs> page =
      _i17.PageInfo<NoteDetailRouterArgs>(name);
}

class NoteDetailRouterArgs {
  const NoteDetailRouterArgs({
    this.key,
    required this.id,
  });

  final _i19.Key? key;

  final String id;

  @override
  String toString() {
    return 'NoteDetailRouterArgs{key: $key, id: $id}';
  }
}
