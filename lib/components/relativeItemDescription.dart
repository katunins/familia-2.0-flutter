import 'package:familia_flutter/components/widgets/userPick.dart';
import 'package:familia_flutter/models/relative.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../themes/sizes.dart';

class RelativeItemWithDescription extends StatelessWidget {
  const RelativeItemWithDescription(
      {Key? key, this.userPick, required this.title})
      : super(key: key);

  final String? userPick;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: AppSizes.userPickWidth,
      child: Column(
        children: [
          UserPick(userPic: userPick),
          const SizedBox(height: 4),
          Text(
            title,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
