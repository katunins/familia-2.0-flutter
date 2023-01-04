// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_item.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NoteItemStore on NoteItemBase, Store {
  late final _$dataAtom = Atom(name: 'NoteItemBase.data', context: context);

  @override
  NoteModel get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(NoteModel value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  late final _$NoteItemBaseActionController =
      ActionController(name: 'NoteItemBase', context: context);

  @override
  dynamic set(NoteModel note) {
    final _$actionInfo =
        _$NoteItemBaseActionController.startAction(name: 'NoteItemBase.set');
    try {
      return super.set(note);
    } finally {
      _$NoteItemBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
data: ${data}
    ''';
  }
}
