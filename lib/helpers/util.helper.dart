import 'package:familia_flutter/config.dart';
import 'package:familia_flutter/models/searchData.model.dart';
import 'package:flutter/cupertino.dart';

import '../main.dart';
import '../models/gender.enum.dart';

isEmailFormat(String? email) {
  if (email == null) {
    return false;
  }
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

getImageUrl(String? imageUrl) {
  if (imageUrl == null) return null;
  return Config.baseApiOptions.baseUrl + imageUrl;
}

getOriginalImageUrl(String? imageUrl) {
  if (imageUrl == null) return null;
  return imageUrl.substring(Config.baseApiOptions.baseUrl.length);
}

getBearerToken() {
  return 'Bearer ${localStorage.read('access-token')}';
}

getPaginationQueryParams(
        {required int page, required SearchDataModel searchData}) =>
    {
      'page': page.toString(),
      'pageSize': Config.pageSize.toString(),
      'searchData': searchData.toMap()
    };

getGenderFromJson(String? value) {
  switch (value) {
    case 'male':
      return Gender.male;

    case 'female':
      return Gender.female;

    default:
      return null;
  }
}

RenderBox? getRenderBox(GlobalKey globalKey){
  if (globalKey.currentContext == null){
    return null;
  }
  return globalKey.currentContext!.findRenderObject() as RenderBox;
}
