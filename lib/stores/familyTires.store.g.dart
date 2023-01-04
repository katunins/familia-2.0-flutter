// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'familyTires.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FamilyTiresStore on FamilyTiresBase, Store {
  late final _$childrenAtom =
      Atom(name: 'FamilyTiresBase.children', context: context);

  @override
  List<String> get children {
    _$childrenAtom.reportRead();
    return super.children;
  }

  @override
  set children(List<String> value) {
    _$childrenAtom.reportWrite(value, super.children, () {
      super.children = value;
    });
  }

  late final _$grandsonsAtom =
      Atom(name: 'FamilyTiresBase.grandsons', context: context);

  @override
  List<String> get grandsons {
    _$grandsonsAtom.reportRead();
    return super.grandsons;
  }

  @override
  set grandsons(List<String> value) {
    _$grandsonsAtom.reportWrite(value, super.grandsons, () {
      super.grandsons = value;
    });
  }

  late final _$sisterBrothersAtom =
      Atom(name: 'FamilyTiresBase.sisterBrothers', context: context);

  @override
  List<String> get sisterBrothers {
    _$sisterBrothersAtom.reportRead();
    return super.sisterBrothers;
  }

  @override
  set sisterBrothers(List<String> value) {
    _$sisterBrothersAtom.reportWrite(value, super.sisterBrothers, () {
      super.sisterBrothers = value;
    });
  }

  late final _$grandParentsAtom =
      Atom(name: 'FamilyTiresBase.grandParents', context: context);

  @override
  List<String> get grandParents {
    _$grandParentsAtom.reportRead();
    return super.grandParents;
  }

  @override
  set grandParents(List<String> value) {
    _$grandParentsAtom.reportWrite(value, super.grandParents, () {
      super.grandParents = value;
    });
  }

  late final _$greatGrandParentsAtom =
      Atom(name: 'FamilyTiresBase.greatGrandParents', context: context);

  @override
  List<String> get greatGrandParents {
    _$greatGrandParentsAtom.reportRead();
    return super.greatGrandParents;
  }

  @override
  set greatGrandParents(List<String> value) {
    _$greatGrandParentsAtom.reportWrite(value, super.greatGrandParents, () {
      super.greatGrandParents = value;
    });
  }

  late final _$greatGreatGrandParentsAtom =
      Atom(name: 'FamilyTiresBase.greatGreatGrandParents', context: context);

  @override
  List<String> get greatGreatGrandParents {
    _$greatGreatGrandParentsAtom.reportRead();
    return super.greatGreatGrandParents;
  }

  @override
  set greatGreatGrandParents(List<String> value) {
    _$greatGreatGrandParentsAtom
        .reportWrite(value, super.greatGreatGrandParents, () {
      super.greatGreatGrandParents = value;
    });
  }

  late final _$spousesAtom =
      Atom(name: 'FamilyTiresBase.spouses', context: context);

  @override
  List<String> get spouses {
    _$spousesAtom.reportRead();
    return super.spouses;
  }

  @override
  set spouses(List<String> value) {
    _$spousesAtom.reportWrite(value, super.spouses, () {
      super.spouses = value;
    });
  }

  late final _$FamilyTiresBaseActionController =
      ActionController(name: 'FamilyTiresBase', context: context);

  @override
  dynamic _getChildren() {
    final _$actionInfo = _$FamilyTiresBaseActionController.startAction(
        name: 'FamilyTiresBase._getChildren');
    try {
      return super._getChildren();
    } finally {
      _$FamilyTiresBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _getGrandsons() {
    final _$actionInfo = _$FamilyTiresBaseActionController.startAction(
        name: 'FamilyTiresBase._getGrandsons');
    try {
      return super._getGrandsons();
    } finally {
      _$FamilyTiresBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _getSisterBrothers() {
    final _$actionInfo = _$FamilyTiresBaseActionController.startAction(
        name: 'FamilyTiresBase._getSisterBrothers');
    try {
      return super._getSisterBrothers();
    } finally {
      _$FamilyTiresBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _getGrandParents() {
    final _$actionInfo = _$FamilyTiresBaseActionController.startAction(
        name: 'FamilyTiresBase._getGrandParents');
    try {
      return super._getGrandParents();
    } finally {
      _$FamilyTiresBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _getGreatGrandParents() {
    final _$actionInfo = _$FamilyTiresBaseActionController.startAction(
        name: 'FamilyTiresBase._getGreatGrandParents');
    try {
      return super._getGreatGrandParents();
    } finally {
      _$FamilyTiresBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _getGreatGreatGrandParents() {
    final _$actionInfo = _$FamilyTiresBaseActionController.startAction(
        name: 'FamilyTiresBase._getGreatGreatGrandParents');
    try {
      return super._getGreatGreatGrandParents();
    } finally {
      _$FamilyTiresBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _getSpouses() {
    final _$actionInfo = _$FamilyTiresBaseActionController.startAction(
        name: 'FamilyTiresBase._getSpouses');
    try {
      return super._getSpouses();
    } finally {
      _$FamilyTiresBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
children: ${children},
grandsons: ${grandsons},
sisterBrothers: ${sisterBrothers},
grandParents: ${grandParents},
greatGrandParents: ${greatGrandParents},
greatGreatGrandParents: ${greatGreatGrandParents},
spouses: ${spouses}
    ''';
  }
}
