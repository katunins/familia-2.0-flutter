import 'package:familia_flutter/models/tree_element.dart';
import 'package:familia_flutter/themes/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/user_pic.dart';

class UserItemWithDescription extends StatelessWidget {
  const UserItemWithDescription(
      {Key? key, this.onPressed, this.user, this.userPicSize, this.title, this.horizontalPadding = 0, this.fontSize})
      : super(key: key);

  final Function(String userId)? onPressed;
  final TreeElementModel? user;
  final double? userPicSize;
  final String? title;
  final double? fontSize;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    var onTap = (onPressed != null && user != null) ? () => onPressed!(user!.id) : null;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          UserPic(
            userPic: user?.userPic,
            size: userPicSize,
          ),
          const SizedBox(height: 4),
          SizedBox(
            width: (userPicSize ?? AppSizes.userPicSize) + horizontalPadding * 2,
            child: Text(
              title ?? user?.title ?? '',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: fontSize),
              maxLines: 3,
            ),
          )
        ],
      ),
    );
  }
}
