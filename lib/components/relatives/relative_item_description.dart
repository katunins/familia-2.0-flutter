import 'package:familia_flutter/themes/text.theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../themes/sizes.dart';
import '../common/user_pick.dart';

class RelativeItemWithDescription extends StatelessWidget {
  const RelativeItemWithDescription(
      {Key? key,
      this.userPick,
      required this.title,
      this.onPressed,
      required this.userId})
      : super(key: key);

  final String userId;
  final String? userPick;
  final String title;
  final Function(String userId)? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: AppSizes.userPickWidth + 30,
      child: GestureDetector(
        onTap: onPressed == null ? null : () => onPressed!(userId),
        child: Column(
          children: [
            UserPick(userPic: userPick),
            const SizedBox(height: 4),
            Text(
              title,
              textAlign: TextAlign.center,
              style: miniTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
