import 'package:familia_flutter/models/relative.model.dart';

import 'api.dart';

class RelativesService {
  final apiUrl = 'relatives';

  Future<List<dynamic>?> getRelatives() async {
    var response = await Api().dio.get(apiUrl);

    if (response.statusCode != 200) {
      return null;
    }
    return response.data;
  }

  Future<RelativeModel?> updateRelative({required Map<String, dynamic> dataObj, required String relativeId}) async {
    var response = await Api()
        .dio
        .post(apiUrl, data: {'data': dataObj, 'relativeId': relativeId});

    if (response.statusCode != 201) {
      return null;
    }
    return RelativeModel.fromJson(response.data);
  }

  Future<RelativeModel?> createRelative({required Map<String, dynamic> dataObj}) async {
    var response = await Api()
        .dio
        .put(apiUrl, data: {'data': dataObj});

    if (response.statusCode != 200) {
      return null;
    }
    return RelativeModel.fromJson(response.data);
  }

  Future<bool> deleteRelative(String relativeId) async {
    var response = await Api()
        .dio
        .delete(apiUrl, data: {'relativeId': relativeId});

    return response.statusCode == 200;
  }
}
