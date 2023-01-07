import 'package:familia_flutter/components/common/image_with_button.dart';
import 'package:familia_flutter/components/common/image_widget.dart';
import 'package:familia_flutter/helpers/get_image_picker.dart';
import 'package:familia_flutter/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageWithUpload extends StatelessWidget {
  const ImageWithUpload(
      {Key? key, this.onSelected, this.path, this.isSquare = false})
      : super(key: key);

  final Function({required XFile image})? onSelected;
  final bool isSquare;
  final String? path;

  _onSelectedPress() async {
    var newImage = await getImagePicker(isSquare: isSquare);
    if (newImage == null) {
      return;
    }
    if (onSelected != null) {
      onSelected!(image: newImage);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (path == null && onSelected != null) {
      return ElevatedButton(
        onPressed: _onSelectedPress,
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
        ),
        // child: Image.asset(AppImages.empty),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width * 0.8,
          child: Icon(
            Icons.photo_camera_outlined,
            size: 90.0,
            color: AppColors.whiteColor,
          ),
        ),
      );
    }
    if (onSelected == null) {
      return getImageWidget(path: path!);
    }
    return ImageWithButton(
        path: path!,
        onTap: _onSelectedPress,
        icon: Icons.photo_camera
    );
  }
}
