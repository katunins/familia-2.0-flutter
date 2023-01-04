import 'package:familia_flutter/components/common/image_with_button.dart';
import 'package:familia_flutter/components/common/image_widget.dart';
import 'package:familia_flutter/helpers/get_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageWithUpload extends StatelessWidget {
  const ImageWithUpload(
      {Key? key, this.onUpload, this.path, this.isSquare = false})
      : super(key: key);

  final Function({required XFile image})? onUpload;
  final bool isSquare;
  final String? path;

  _onUploadPress() async {
    var newImage = await getImagePicker(isSquare: isSquare);
    if (newImage == null) {
      return;
    }
    if (onUpload != null) {
      onUpload!(image: newImage);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (path == null && onUpload != null) {
      return ElevatedButton(
        onPressed: _onUploadPress,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black12,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            // side: const BorderSide(color: Colors.black26, width: 2),
            borderRadius: BorderRadius.circular(150.0),
          ),
          minimumSize: Size.zero,
          fixedSize: const Size.square(120),
        ),
        child: const Icon(
          Icons.photo_camera_outlined,
          size: 40.0,
          color: Colors.black38,
        ),
      );
    }
    if (onUpload == null) {
      return getImageWidget(path: path!);
    }
    return ImageWithButton(
        path: path!,
        onTap: _onUploadPress,
        icon: const Icon(
          Icons.photo_camera,
          size: 25,
        )
    );
  }
}
