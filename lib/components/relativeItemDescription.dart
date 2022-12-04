import 'package:familia_flutter/components/widgets/imageWidget.dart';
import 'package:familia_flutter/components/widgets/userPick.dart';
import 'package:familia_flutter/models/relative.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../themes/sizes.dart';

class RelativeItemWithDescription extends StatelessWidget {
  const RelativeItemWithDescription(
      {Key? key, required this.relative, this.margin})
      : super(key: key);

  final RelativeModel relative;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: AppSizes.userPickWidth,
      child: Column(
        children: [
          UserPick(userPic: relative.userData.userPic),
          const SizedBox(height: 4),
          Text(
            relative.userData.name!,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
