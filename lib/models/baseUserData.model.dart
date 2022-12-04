import 'package:familia_flutter/models/parents.model.dart';

import 'gender.enum.dart';

class BaseUserDataModel {
  String name;
  String? about;
  Gender? gender;
  ParentsModel? parents;
  String? userPic;

  BaseUserDataModel({required this.name, this.about, this.parents, this.userPic, this.gender});
}