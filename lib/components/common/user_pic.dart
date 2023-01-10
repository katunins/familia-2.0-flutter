import 'package:flutter/cupertino.dart';

import '../../themes/sizes.dart';
import 'image_widget.dart';

/// комопнент аватарки родственника в списке

class UserPic extends StatelessWidget {
  const UserPic({Key? key, required this.userPic, this.size}) : super(key: key);

  final String? userPic;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: getImageWidget(
          width: size ?? AppSizes.userPicSize,
          height: size ?? AppSizes.userPicSize,
          fit: BoxFit.cover,
          path: userPic,
      ),
    );
  }
}
