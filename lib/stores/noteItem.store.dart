import 'package:mobx/mobx.dart';

import '../models/note.model.dart';

part 'noteItem.store.g.dart';

class NoteItemStore = NoteItemBase with _$NoteItemStore;

abstract class NoteItemBase with Store {

  NoteItemBase(this.data);

  @observable
  NoteModel data;

  @action
  set(NoteModel note)=> data = note;
}