import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../themes/colors.dart';

class Separator extends StatelessWidget {
  const Separator({Key? key, this.verticalMargin = 32}) : super(key: key);

  final double verticalMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: verticalMargin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.ac_unit, color: AppColors.primaryColor, size: 16),
            const SizedBox(width: 15),
            Icon(Icons.ac_unit, color: AppColors.primaryColor, size: 16),
            const SizedBox(width: 15),
            Icon(Icons.ac_unit, color: AppColors.primaryColor, size: 16)
          ],
        ));
  }
}
