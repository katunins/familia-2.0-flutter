// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relative_item.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RelativeItemStore on RelativeItemStoreBase, Store {
  late final _$dataAtom =
      Atom(name: 'RelativeItemStoreBase.data', context: context);

  @override
  RelativeModel get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(RelativeModel value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  late final _$RelativeItemStoreBaseActionController =
      ActionController(name: 'RelativeItemStoreBase', context: context);

  @override
  dynamic set(RelativeModel relative) {
    final _$actionInfo = _$RelativeItemStoreBaseActionController.startAction(
        name: 'RelativeItemStoreBase.set');
    try {
      return super.set(relative);
    } finally {
      _$RelativeItemStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
data: ${data}
    ''';
  }
}
