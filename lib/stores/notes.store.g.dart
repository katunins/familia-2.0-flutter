// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NotesStore on NotesStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'NotesStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$searchAtom =
      Atom(name: 'NotesStoreBase.search', context: context);

  @override
  String get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(String value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  late final _$notesAtom = Atom(name: 'NotesStoreBase.notes', context: context);

  @override
  ObservableList<NoteModel> get notes {
    _$notesAtom.reportRead();
    return super.notes;
  }

  @override
  set notes(ObservableList<NoteModel> value) {
    _$notesAtom.reportWrite(value, super.notes, () {
      super.notes = value;
    });
  }

  late final _$paginationAtom =
      Atom(name: 'NotesStoreBase.pagination', context: context);

  @override
  PaginationModel get pagination {
    _$paginationAtom.reportRead();
    return super.pagination;
  }

  @override
  set pagination(PaginationModel value) {
    _$paginationAtom.reportWrite(value, super.pagination, () {
      super.pagination = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('NotesStoreBase.init', context: context);

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$loadAsyncAction =
      AsyncAction('NotesStoreBase.load', context: context);

  @override
  Future load({int page = 0}) {
    return _$loadAsyncAction.run(() => super.load(page: page));
  }

  late final _$createAsyncAction =
      AsyncAction('NotesStoreBase.create', context: context);

  @override
  Future<bool> create({required NewNoteModel newNoteData}) {
    return _$createAsyncAction
        .run(() => super.create(newNoteData: newNoteData));
  }

  late final _$updateAsyncAction =
      AsyncAction('NotesStoreBase.update', context: context);

  @override
  Future<bool> update(
      {required NewNoteModel newNoteData,
      required String id,
      required List<String> pathToDelete}) {
    return _$updateAsyncAction.run(() => super
        .update(newNoteData: newNoteData, id: id, pathToDelete: pathToDelete));
  }

  late final _$deleteAsyncAction =
      AsyncAction('NotesStoreBase.delete', context: context);

  @override
  Future<bool> delete(NoteModel note) {
    return _$deleteAsyncAction.run(() => super.delete(note));
  }

  late final _$NotesStoreBaseActionController =
      ActionController(name: 'NotesStoreBase', context: context);

  @override
  dynamic setSearch(dynamic val) {
    final _$actionInfo = _$NotesStoreBaseActionController.startAction(
        name: 'NotesStoreBase.setSearch');
    try {
      return super.setSearch(val);
    } finally {
      _$NotesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
search: ${search},
notes: ${notes},
pagination: ${pagination}
    ''';
  }
}
