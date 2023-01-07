import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../notes/user_picks_line.dart';

class MarkedRelatives extends StatelessWidget {
  const MarkedRelatives(
      {Key? key, required this.userPics, required this.iconButton})
      : super(key: key);

  final List<String> userPics;
  final Widget iconButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: UserPicsLine(userPics: userPics)),
        iconButton
      ],
    );
  }
}
