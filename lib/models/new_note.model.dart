import 'package:image_picker/image_picker.dart';

class NewNoteModel {
  late String title;
  late String description;
  late List<XFile> localImages = [];
  late List<String> relatives;

  NewNoteModel({
    required this.title,
    required this.description,
    required this.localImages,
    required this.relatives,
  });

  NewNoteModel.createEmpty() {
    title = '';
    description = '';
    localImages = [];
    relatives = [];
  }

  Map<String, dynamic> toMap() => {
        'title': title,
        'description': description,
        'relatives': relatives,
      };
}
