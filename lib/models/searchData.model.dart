class SearchDataModel {
  String search;
  List<String> fields;

  SearchDataModel({required this.search, required this.fields});

  Map<String, dynamic> toMap() => {'search': search, 'fields': fields};
}
