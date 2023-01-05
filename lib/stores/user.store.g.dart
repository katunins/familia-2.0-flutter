// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on UserStoreBase, Store {
  Computed<bool>? _$isRequiredFilledComputed;

  @override
  bool get isRequiredFilled => (_$isRequiredFilledComputed ??= Computed<bool>(
          () => super.isRequiredFilled,
          name: 'UserStoreBase.isRequiredFilled'))
      .value;
  Computed<bool>? _$isParentsNotEmptyComputed;

  @override
  bool get isParentsNotEmpty => (_$isParentsNotEmptyComputed ??= Computed<bool>(
          () => super.isParentsNotEmpty,
          name: 'UserStoreBase.isParentsNotEmpty'))
      .value;

  late final _$userAtom = Atom(name: 'UserStoreBase.user', context: context);

  @override
  UserModel? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$UserStoreBaseActionController =
      ActionController(name: 'UserStoreBase', context: context);

  @override
  dynamic setUser(UserModel userModel) {
    final _$actionInfo = _$UserStoreBaseActionController.startAction(
        name: 'UserStoreBase.setUser');
    try {
      return super.setUser(userModel);
    } finally {
      _$UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic resetUser() {
    final _$actionInfo = _$UserStoreBaseActionController.startAction(
        name: 'UserStoreBase.resetUser');
    try {
      return super.resetUser();
    } finally {
      _$UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
isRequiredFilled: ${isRequiredFilled},
isParentsNotEmpty: ${isParentsNotEmpty}
    ''';
  }
}
