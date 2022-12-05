class TreeElementModel {
  late final String id;
  late final String? userPic;
  late final String title;

  TreeElementModel({
    required this.id,
    required this.userPic,
    required this.title});

  TreeElementModel.empty(){
    id = DateTime.now().toIso8601String();
    title = 'Нажмите для добавления';
    userPic = null;
  }
}