import 'package:familia_flutter/models/api_response.model.dart';
import 'package:familia_flutter/models/pagination.model.dart';
import 'package:familia_flutter/stores/note_item.store.dart';
import 'package:mobx/mobx.dart';

import '../config.dart';
import '../services/notes.service.dart';

part 'notes.store.g.dart';

var notesStore = NotesStore();

class NotesStore = NotesStoreBase with _$NotesStore;

abstract class NotesStoreBase with Store {

  @observable
  bool isLoading = false;

  @observable
  var search = '';

  @observable
  var notes = ObservableList<NoteItemStore>.of([]);

  @observable
  PaginationModel pagination = PaginationModel();

  @action
  setSearch(val){
    Future.delayed(Config.requestDelay, () {
      search = val;
      load(page: 0);
    });
  }

  @action
  init() async {
    load(page: 0);
  }

  loadNextPage(){
    if (!isLoading && notes.length < pagination.total){
      load(page: pagination.page + 1);
    }
  }

  @action
  load({int page = 0}) async {
    isLoading = true;
    ApiResponseModel? apiResponse = await NotesService().getNotes(page: 0);
    if (page == 0) {
      notes = ObservableList<NoteItemStore>.of([]);
    }
    if (apiResponse != null) {
      notes.addAll(
        apiResponse.data.map((item) => NoteItemStore(item))
      );
      pagination = apiResponse.pagination;
    }
    isLoading = false;
  }

}