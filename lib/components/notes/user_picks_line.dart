import 'package:familia_flutter/components/common/image_widget.dart';
import 'package:flutter/cupertino.dart';

/// Список аватарок родственников, отмеченных в публикации

class UserPicsLine extends StatelessWidget {
  const UserPicsLine({Key? key, required this.userPics}) : super(key: key);

  final List<String> userPics;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: userPics
          .map((userPic) => ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: getImageWidget(
            width: 50, height: 50, fit: BoxFit.cover, path: userPic),
      ))
          .toList(),
    );
  }
}