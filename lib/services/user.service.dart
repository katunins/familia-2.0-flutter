import 'package:familia_flutter/models/user.model.dart';

import 'api.dart';

class UserService {
  final apiUrl = 'users';

  Future<UserModel?> getUser() async {
    var response = await Api()
        .dio
        .get(apiUrl);

    if (response.statusCode != 200) {
      return null;
    }
    return UserModel.fromJson(response.data);
  }

  Future<UserModel?> updateUser(Map<String, dynamic> dataObj) async {

    var response = await Api()
        .dio
        .post(apiUrl, data: dataObj);

    if (response.statusCode != 201) {
      return null;
    }
    return UserModel.fromJson(response.data);
  }
}