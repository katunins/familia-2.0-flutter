import 'package:familia_flutter/models/parents.model.dart';

class BaseUserDataModel {
  String? name;
  String? about;
  ParentsModel? parents;
  String? userPic;

  BaseUserDataModel({this.name, this.about, this.parents, this.userPic});
}