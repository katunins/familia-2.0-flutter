import 'package:familia_flutter/helpers/util.helper.dart';
import 'package:familia_flutter/models/parents.model.dart';
import 'package:familia_flutter/models/tree_element.dart';

import 'base_user_data.model.dart';

class UserModel {
  late String id;
  late String email;
  late BaseUserDataModel userData;

  UserModel({
    required this.id,
    required this.email,
    required this.userData,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    email = json['email'];
    userData = BaseUserDataModel(
      name: json['name'] ?? '',
      about: json['about'] ?? '',
      parents: json['parents'] == null ? ParentsModel.createEmpty() : ParentsModel.fromJson(json['parents']),
      gender: getGenderFromJson(json['gender']),
      userPic: getImageUrl(json['userPic']),

    );
  }

  toMap() {
    var dataObj = {
      'name':userData.name,
      'about':userData.about,
      'parents': userData.parents.toMap(),
      'gender': userData.gender.name,
      'email': email,
    };
    if (userData.userPic != null) dataObj['userPic'] = userData.userPic!;
    return dataObj;
  }

  toTreeElement(){
    return TreeElementModel(
        id: id,
        userPic: userData.userPic,
        title: userData.name,
        parents: userData.parents
    );
  }
}
