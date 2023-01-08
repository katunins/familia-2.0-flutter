import 'package:familia_flutter/models/base_user_data.model.dart';
import 'package:familia_flutter/models/parents.model.dart';
import 'package:familia_flutter/models/tree_element.dart';

import '../helpers/util.helper.dart';

class RelativeModel {
  late String id;
  late BaseUserDataModel userData;
  late RelativeAccessModel access;

  RelativeModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    userData = BaseUserDataModel(
      userPic: getImageUrl(json['userPic']),
      gender: getGenderFromJson(json['gender']),
      about: json['about'],
      name: json['name'],
      parents: ParentsModel.fromJson(json['parents']),
    );
    access = RelativeAccessModel.fromJson(json['access']);
  }

  TreeElementModel toTreeElement() {
    return TreeElementModel(
        id: id,
        userPic: userData.userPic,
        title: userData.name.isNotEmpty ? userData.name : 'Без имени',
        parents: userData.parents,
        gender: userData.gender);
  }
}

class RelativeAccessModel {
  late String creatorId;
  late List<String> shareId;

  RelativeAccessModel({required this.creatorId, required this.shareId});

  RelativeAccessModel.fromJson(Map<String, dynamic> json) {
    creatorId = json['creatorId'];
    shareId = (json['shareId'] as List).map((item) => item.toString()).toList();
  }
}
