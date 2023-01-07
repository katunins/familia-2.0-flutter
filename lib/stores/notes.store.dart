import 'package:familia_flutter/models/api_response.model.dart';
import 'package:familia_flutter/models/new_note.model.dart';
import 'package:familia_flutter/models/note.model.dart';
import 'package:familia_flutter/models/pagination.model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

import '../config.dart';
import '../helpers/util.helper.dart';
import '../services/notes.service.dart';
import '../services/storage.service.dart';

part 'notes.store.g.dart';

var notesStore = NotesStore();

class NotesStore = NotesStoreBase with _$NotesStore;

abstract class NotesStoreBase with Store {
  @observable
  bool isLoading = false;

  @observable
  var search = '';

  @observable
  var notes = ObservableList<NoteModel>.of([]);
  // var notes = ObservableList<NoteItemStore>.of([]);

  @observable
  PaginationModel pagination = PaginationModel();

  NoteModel getById(String id) => notes.firstWhere((element) => element.id == id);

  @action
  setSearch(val) {
    Future.delayed(Config.requestDelay, () {
      search = val;
      load(page: 0);
    });
  }

  @action
  init() async {
    await load(page: 0);
  }

  loadNextPage() {
    if (!isLoading && notes.length < pagination.total) {
      load(page: pagination.page + 1);
    }
  }

  @action
  load({int page = 0}) async {
    isLoading = true;
    ApiResponseModel<NoteModel>? apiResponse = await NotesService().getNotes(page: 0);
    if (page == 0) {
      notes = ObservableList<NoteModel>.of([]);
      // notes = ObservableList<NoteItemStore>.of([]);
    }
    if (apiResponse != null) {
      notes.addAll(apiResponse.data);
      // notes.addAll(apiResponse.data.map((item) => NoteItemStore(item)));
      pagination = apiResponse.pagination;
    }
    isLoading = false;
  }

  @action
  Future<bool> create({required NewNoteModel newNoteData}) async {
    isLoading = true;

    var dataObj = {...newNoteData.toMap(), 'images': []};

    if (newNoteData.localImages.isNotEmpty) {
      List<String>? imageUrls = await StorageApi().uploadImages(
          images: newNoteData.localImages,
          pathType: 'notes',
          filesToDelete: []);
      if (imageUrls != null) {
        dataObj['images'] = imageUrls;
      }
    }

    NoteModel? note = await NotesService().create(dataObj: dataObj);
    if (note != null) {
      await init();
    }
    isLoading = false;
    return note != null;
  }

  @action
  Future<bool> update(
      {required NewNoteModel newNoteData,
      required String id,
      required List<String> pathToDelete}) async {
    isLoading = true;
    var dataObj = {...newNoteData.toMap(), 'images': []};
    int index = notes.indexWhere((element)=>element.id == id);
    // int index = notes.indexWhere((element) => element.data.id == id);

    if (index < 0) {
      Exception('Ошибка в архиве');
      return false;
    }

    List<XFile> imagesToUpload = newNoteData.localImages
        .where(
            (element) => !element.path.contains(Config.baseApiOptions.baseUrl))
        .toList();

    List<String>? uploadedImages = await StorageApi().uploadImages(
        images: imagesToUpload, pathType: 'notes', filesToDelete: pathToDelete);

    var images = <String>[];
    int i = 0;
    for (var item in newNoteData.localImages) {
      if (item.path.contains(Config.baseApiOptions.baseUrl)) {
        images.add(removeBaseUrl(item.path));
      } else {
        var newImagePath = uploadedImages?[i];
        if (newImagePath != null) {
          images.add(newImagePath);
          i++;
        }
      }
    }

    dataObj['images'] = images;

    NoteModel? updatedNote = await NotesService().update(dataObj: dataObj, id: id);
    if (updatedNote != null) {
      notes[index] = updatedNote;
    }
    isLoading = false;
    return updatedNote != null;
  }

  @action
  Future<bool> delete(NoteModel note) async {
    var result = await NotesService().delete(id: note.id);
    await StorageApi().delete(filesToDelete: note.images);
    if (result) {
      await init();
    }
    return result;
  }
}
