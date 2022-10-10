import 'package:familia_flutter/config.dart';
import 'package:familia_flutter/helpers/util.helper.dart';
import 'package:familia_flutter/models/relative.model.dart';
import 'package:familia_flutter/models/searchData.model.dart';

import 'api.dart';

class RelativesService {
  final apiUrl = 'relatives';

  Future<Map<String, dynamic>?> getRelatives(
      {required int page, required SearchDataModel searchData}) async {

    var response = await Api().dio.get(apiUrl,
        queryParameters:
            getPaginationQueryParams(page: page, searchData: searchData));

    if (response.statusCode != 200) {
      return null;
    }
    return response.data;
  }

  Future<RelativeModel?> updateRelative(Map<String, dynamic> dataObj) async {
    var response = await Api().dio.post(apiUrl, data: dataObj);

    if (response.statusCode != 201) {
      return null;
    }
    return RelativeModel.fromJson(response.data);
  }
}
