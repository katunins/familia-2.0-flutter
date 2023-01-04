import 'package:flutter/cupertino.dart';

import '../../../themes/colors.dart';

class VerticalBranchLine extends StatelessWidget {
  const VerticalBranchLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 2,
      height: 20,
      color: AppColors.primaryColor,
    );
  }
}
