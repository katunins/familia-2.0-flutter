enum TreeElementTypes {
  relative,
  empty
}

class TreeElementModel {
  late final String id;
  late final String? userPic;
  late final String? title;
  TreeElementTypes type = TreeElementTypes.relative;


  TreeElementModel(
      {required this.id, required this.userPic, required this.title});

  TreeElementModel.empty() {
    id = DateTime.now().toIso8601String();
    type = TreeElementTypes.empty;
  }
}
