// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NavigationStore on NavigationStoreBase, Store {
  Computed<dynamic>? _$currentAppRouteComputed;

  @override
  dynamic get currentAppRoute => (_$currentAppRouteComputed ??=
          Computed<dynamic>(() => super.currentAppRoute,
              name: 'NavigationStoreBase.currentAppRoute'))
      .value;

  late final _$_currentAppRouteAtom =
      Atom(name: 'NavigationStoreBase._currentAppRoute', context: context);

  @override
  TabRoutes get _currentAppRoute {
    _$_currentAppRouteAtom.reportRead();
    return super._currentAppRoute;
  }

  @override
  set _currentAppRoute(TabRoutes value) {
    _$_currentAppRouteAtom.reportWrite(value, super._currentAppRoute, () {
      super._currentAppRoute = value;
    });
  }

  late final _$NavigationStoreBaseActionController =
      ActionController(name: 'NavigationStoreBase', context: context);

  @override
  void setCurrentTab(TabRoutes appRoute) {
    final _$actionInfo = _$NavigationStoreBaseActionController.startAction(
        name: 'NavigationStoreBase.setCurrentTab');
    try {
      return super.setCurrentTab(appRoute);
    } finally {
      _$NavigationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentAppRoute: ${currentAppRoute}
    ''';
  }
}
