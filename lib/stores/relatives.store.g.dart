// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relatives.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RelativesStore on RelativesStoreBase, Store {
  late final _$relativesAtom =
      Atom(name: 'RelativesStoreBase.relatives', context: context);

  @override
  ObservableList<RelativeItemStore> get relatives {
    _$relativesAtom.reportRead();
    return super.relatives;
  }

  @override
  set relatives(ObservableList<RelativeItemStore> value) {
    _$relativesAtom.reportWrite(value, super.relatives, () {
      super.relatives = value;
    });
  }

  late final _$deleteRelativeAsyncAction =
      AsyncAction('RelativesStoreBase.deleteRelative', context: context);

  @override
  Future deleteRelative(String relativeId) {
    return _$deleteRelativeAsyncAction
        .run(() => super.deleteRelative(relativeId));
  }

  late final _$loadDataAsyncAction =
      AsyncAction('RelativesStoreBase.loadData', context: context);

  @override
  Future loadData({bool loadMore = false}) {
    return _$loadDataAsyncAction.run(() => super.loadData(loadMore: loadMore));
  }

  late final _$RelativesStoreBaseActionController =
      ActionController(name: 'RelativesStoreBase', context: context);

  @override
  dynamic addRelative(RelativeModel relative) {
    final _$actionInfo = _$RelativesStoreBaseActionController.startAction(
        name: 'RelativesStoreBase.addRelative');
    try {
      return super.addRelative(relative);
    } finally {
      _$RelativesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
relatives: ${relatives}
    ''';
  }
}
