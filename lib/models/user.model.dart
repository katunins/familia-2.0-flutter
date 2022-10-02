import 'package:familia_flutter/helpers/util.helper.dart';
import 'package:familia_flutter/models/parents.model.dart';

import 'baseUserData.model.dart';

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
      userPic: getImageUrl(json['userPic']),
      about: json['about'],
      name: json['name'],
      parents: ParentsModel.fromJson(json['parents']),
    );
  }

  toMap() {
    var dataObj = {'email': email, 'parents': userData.parents};
    if (userData.name != null) dataObj['userPic'] = userData.name;
    if (userData.userPic != null) dataObj['userPic'] = userData.userPic;
    if (userData.about != null) dataObj['about'] = userData.about;
    return dataObj;
  }
}
