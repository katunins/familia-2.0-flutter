import 'package:familia_flutter/components/widgets/imageWidget.dart';
import 'package:familia_flutter/helpers/getImagePicker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../themes/colors.dart';

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
    return Stack(
      children: [
        getImageWidget(path: path!),
        Positioned(
            right: 20,
            bottom: 20,
            child: GestureDetector(
              onTap: _onUploadPress,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.whiteColor,
                ),
                padding: const EdgeInsets.all(7),
                child: const Icon(
                  Icons.photo_camera,
                  size: 25,
                ),
              ),
            ))
      ],
    );
  }
}
