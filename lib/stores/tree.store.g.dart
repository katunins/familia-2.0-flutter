// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TreeStore on TreeStoreBase, Store {
  Computed<double>? _$userPicSizeComputed;

  @override
  double get userPicSize =>
      (_$userPicSizeComputed ??= Computed<double>(() => super.userPicSize,
              name: 'TreeStoreBase.userPicSize'))
          .value;
  Computed<double>? _$treeElementHeightComputed;

  @override
  double get treeElementHeight => (_$treeElementHeightComputed ??=
          Computed<double>(() => super.treeElementHeight,
              name: 'TreeStoreBase.treeElementHeight'))
      .value;
  Computed<double>? _$paddingBetweenComputed;

  @override
  double get paddingBetween =>
      (_$paddingBetweenComputed ??= Computed<double>(() => super.paddingBetween,
              name: 'TreeStoreBase.paddingBetween'))
          .value;
  Computed<double>? _$itemBlockWidthComputed;

  @override
  double get itemBlockWidth =>
      (_$itemBlockWidthComputed ??= Computed<double>(() => super.itemBlockWidth,
              name: 'TreeStoreBase.itemBlockWidth'))
          .value;
  Computed<FamilyTies>? _$rootFamilyTiesComputed;

  @override
  FamilyTies get rootFamilyTies => (_$rootFamilyTiesComputed ??=
          Computed<FamilyTies>(() => super.rootFamilyTies,
              name: 'TreeStoreBase.rootFamilyTies'))
      .value;

  late final _$rootUserAtom =
      Atom(name: 'TreeStoreBase.rootUser', context: context);

  @override
  TreeElementModel get rootUser {
    _$rootUserAtom.reportRead();
    return super.rootUser;
  }

  @override
  set rootUser(TreeElementModel value) {
    _$rootUserAtom.reportWrite(value, super.rootUser, () {
      super.rootUser = value;
    });
  }

  late final _$zoomAtom = Atom(name: 'TreeStoreBase.zoom', context: context);

  @override
  double get zoom {
    _$zoomAtom.reportRead();
    return super.zoom;
  }

  @override
  set zoom(double value) {
    _$zoomAtom.reportWrite(value, super.zoom, () {
      super.zoom = value;
    });
  }

  late final _$TreeStoreBaseActionController =
      ActionController(name: 'TreeStoreBase', context: context);

  @override
  dynamic setElementKey(
      {required String userId,
      required GlobalKey<State<StatefulWidget>> globalKey}) {
    final _$actionInfo = _$TreeStoreBaseActionController.startAction(
        name: 'TreeStoreBase.setElementKey');
    try {
      return super.setElementKey(userId: userId, globalKey: globalKey);
    } finally {
      _$TreeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setRootUser(TreeElementModel user) {
    final _$actionInfo = _$TreeStoreBaseActionController.startAction(
        name: 'TreeStoreBase.setRootUser');
    try {
      return super.setRootUser(user);
    } finally {
      _$TreeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setUserPicSize(double val) {
    final _$actionInfo = _$TreeStoreBaseActionController.startAction(
        name: 'TreeStoreBase.setUserPicSize');
    try {
      return super.setUserPicSize(val);
    } finally {
      _$TreeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
rootUser: ${rootUser},
zoom: ${zoom},
userPicSize: ${userPicSize},
treeElementHeight: ${treeElementHeight},
paddingBetween: ${paddingBetween},
itemBlockWidth: ${itemBlockWidth},
rootFamilyTies: ${rootFamilyTies}
    ''';
  }
}
