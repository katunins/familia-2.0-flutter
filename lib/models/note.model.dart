import 'package:familia_flutter/helpers/util.helper.dart';

class NoteModel {
  late String id;
  late String title;
  late String description;
  late List<String> images = [];
  late List<String> relatives;

  NoteModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    description = json['description'];
    for (var imageUrl in json['images']) {
      var localImageUrl = getImageUrl(imageUrl);
      if (localImageUrl != null){
        images.add(localImageUrl);
      }
    }
    relatives = (json['relatives'] as List).map((e) => e.toString()).toList();
  }
}