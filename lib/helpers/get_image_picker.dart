import 'package:familia_flutter/themes/colors.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../main.dart';

Future<XFile?> getImagePicker({
  bool isSquare = false,
}) async {
  try {
    var value = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (value == null) {
      throw Exception('101 - pickImage');
    }
    var croppedFile = await ImageCropper().cropImage(
      sourcePath: value.path,
      aspectRatio: isSquare ? const CropAspectRatio(ratioX: 1, ratioY: 1) : null,
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: AppColors.primaryColor,
            toolbarWidgetColor: AppColors.whiteColor,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: isSquare
        ),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );
    if (croppedFile == null) {
      throw Exception('102 - imageCropper');
    }
    var uploadImage = XFile(croppedFile.path, name: value.name);
    return uploadImage;
  } on Exception catch (error) {
    print(error);
  }
  return null;
}
