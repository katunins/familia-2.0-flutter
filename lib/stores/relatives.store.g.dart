// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relatives.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RelativesStore on RelativesStoreBase, Store {
  Computed<bool>? _$canLoadMoreComputed;

  @override
  bool get canLoadMore =>
      (_$canLoadMoreComputed ??= Computed<bool>(() => super.canLoadMore,
              name: 'RelativesStoreBase.canLoadMore'))
          .value;

  late final _$searchDataAtom =
      Atom(name: 'RelativesStoreBase.searchData', context: context);

  @override
  SearchDataModel get searchData {
    _$searchDataAtom.reportRead();
    return super.searchData;
  }

  @override
  set searchData(SearchDataModel value) {
    _$searchDataAtom.reportWrite(value, super.searchData, () {
      super.searchData = value;
    });
  }

  late final _$relativesAtom =
      Atom(name: 'RelativesStoreBase.relatives', context: context);

  @override
  RelativesModel get relatives {
    _$relativesAtom.reportRead();
    return super.relatives;
  }

  @override
  set relatives(RelativesModel value) {
    _$relativesAtom.reportWrite(value, super.relatives, () {
      super.relatives = value;
    });
  }

  late final _$loadDataAsyncAction =
      AsyncAction('RelativesStoreBase.loadData', context: context);

  @override
  Future loadData({required int page}) {
    return _$loadDataAsyncAction.run(() => super.loadData(page: page));
  }

  late final _$loadMoreAsyncAction =
      AsyncAction('RelativesStoreBase.loadMore', context: context);

  @override
  Future loadMore() {
    return _$loadMoreAsyncAction.run(() => super.loadMore());
  }

  late final _$RelativesStoreBaseActionController =
      ActionController(name: 'RelativesStoreBase', context: context);

  @override
  dynamic setSearch(String search) {
    final _$actionInfo = _$RelativesStoreBaseActionController.startAction(
        name: 'RelativesStoreBase.setSearch');
    try {
      return super.setSearch(search);
    } finally {
      _$RelativesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic resetSearch() {
    final _$actionInfo = _$RelativesStoreBaseActionController.startAction(
        name: 'RelativesStoreBase.resetSearch');
    try {
      return super.resetSearch();
    } finally {
      _$RelativesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchData: ${searchData},
relatives: ${relatives},
canLoadMore: ${canLoadMore}
    ''';
  }
}
