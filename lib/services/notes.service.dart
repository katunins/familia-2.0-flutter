import 'package:familia_flutter/models/api_response.model.dart';
import 'package:familia_flutter/models/note.model.dart';
import 'package:familia_flutter/models/pagination.model.dart';
import 'package:familia_flutter/stores/notes.store.dart';

import '../config.dart';
import 'api.dart';

class NotesService {
  final apiUrl = 'notes';

  Future<ApiResponseModel<NoteModel>?> getNotes({required int page}) async {
    var queryParameters = {
      'search': notesStore.search,
      'pagination': {'page': page, 'pageSize': Config.pageSize}
    };

    var response =
        await Api().dio.get(apiUrl, queryParameters: queryParameters);

    if (response.statusCode != 200) {
      return null;
    }

    return ApiResponseModel(
        data: response.data['data']
            .map<NoteModel>((json) => NoteModel.fromJson(json))
            .toList(),
        pagination: PaginationModel.fromJson(response.data['pagination']));
  }

  Future<ApiResponseModel<NoteModel>?> getRelativeNotes(
      {required int page,
      required String relativeId,
      required String search}) async {
    var queryParameters = {
      'relativeId': relativeId,
      'search': search,
      'pagination': {'page': page, 'pageSize': Config.pageSize}
    };

    var response = await Api()
        .dio
        .get('$apiUrl/by-user', queryParameters: queryParameters);

    if (response.statusCode != 200) {
      return null;
    }

    return ApiResponseModel(
        data: response.data['data']
            .map<NoteModel>((json) => NoteModel.fromJson(json))
            .toList(),
        pagination: PaginationModel.fromJson(response.data['pagination']));
  }

  Future<int?> getRelativeNotesCount(String relativeId) async {
    var queryParameters = {
      'relativeId': relativeId,
    };

    var response = await Api()
        .dio
        .get('$apiUrl/user-count', queryParameters: queryParameters);

    if (response.statusCode != 200) {
      return null;
    }

    return int.parse(response.data);
  }

  Future<NoteModel?> create({required Map<String, dynamic> dataObj}) async {
    var response = await Api().dio.put(apiUrl, data: dataObj);

    if (response.statusCode != 200) {
      return null;
    }

    return NoteModel.fromJson(response.data);
  }

  Future<NoteModel?> update(
      {required String id, required Map<String, dynamic> dataObj}) async {
    var response =
        await Api().dio.post(apiUrl, data: {'id': id, 'data': dataObj});

    if (response.statusCode != 201) {
      return null;
    }

    return NoteModel.fromJson(response.data);
  }

  Future<bool> delete({required String id}) async {
    var dataObj = {'id': id};

    var response = await Api().dio.delete(apiUrl, data: dataObj);

    return response.statusCode == 200;
  }
}
