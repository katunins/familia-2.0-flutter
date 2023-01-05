import 'package:familia_flutter/models/parents.model.dart';

import 'gender.enum.dart';

class BaseUserDataModel {
  late String name;
  late String about;
  late Gender gender;
  late ParentsModel parents;
  String? userPic;

  BaseUserDataModel(
      {required this.name,
      required this.about,
      required this.gender,
      required this.parents,
      this.userPic});

  BaseUserDataModel.createEmpty() {
    name = '';
    about = '';
    gender = Gender.none;
    parents = ParentsModel.createEmpty();
  }

  toMap() {
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
