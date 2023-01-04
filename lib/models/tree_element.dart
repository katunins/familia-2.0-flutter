import 'package:familia_flutter/models/parents.model.dart';

enum TreeElementTypes {
  relative,
  empty
}

class TreeElementModel {
  late final String id;
  late final String? userPic;
  late final String? title;
  late final ParentsModel parents;
  TreeElementTypes type = TreeElementTypes.relative;


  TreeElementModel({required this.id, required this.userPic, required this.title, required this.parents});

  TreeElementModel.empty() {
    id = DateTime.now().toIso8601String();
    type = TreeElementTypes.empty;
    parents = ParentsModel.createEmpty();
  }
}
