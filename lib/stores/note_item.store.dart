import 'package:mobx/mobx.dart';

import '../models/note.model.dart';

part 'note_item.store.g.dart';

class NoteItemStore = NoteItemBase with _$NoteItemStore;

abstract class NoteItemBase with Store {

  NoteItemBase(this.data);

  @observable
  NoteModel data;

  @action
  set(NoteModel note)=> data = note;
}