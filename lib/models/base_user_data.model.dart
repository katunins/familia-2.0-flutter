import 'package:familia_flutter/models/parents.model.dart';

import 'gender.enum.dart';

class BaseUserDataModel {
  String name;
  String about;
  Gender gender;
  ParentsModel parents;
  String? userPic;

  BaseUserDataModel({
    required this.name,
    required this.about,
    required this.gender,
    required this.parents,
    this.userPic});

  toMap(){
    Map<String, dynamic> dataObj = {
      'name': name,
      'about': about,
      'gender': gender.name,
      'parents': parents.toMap()
    };
    if (userPic != null) dataObj['userPic'] = userPic;
    return dataObj;
  }
}