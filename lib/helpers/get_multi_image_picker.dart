import 'package:image_picker/image_picker.dart';

import '../main.dart';

Future<List<XFile>> getMultiImagePicker() async {
  try {
    var images = await imagePicker.pickMultiImage();
    return images ?? [];
  } on Exception {
    return [];
  }
}
