import 'package:flutter/cupertino.dart';

import '../../themes/sizes.dart';
import 'image_widget.dart';

/// комопнент аватарки родственника в списке

class UserPick extends StatelessWidget {
  const UserPick({Key? key, required this.userPic}) : super(key: key);

  final String? userPic;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: getImageWidget(
          width: AppSizes.userPickWidth,
          height: AppSizes.userPickWidth,
          fit: BoxFit.cover,
          path: userPic,
      ),
    );
  }
}
