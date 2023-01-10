import 'package:familia_flutter/themes/sizes.dart';
import 'package:flutter/cupertino.dart';

import '../../../themes/colors.dart';

class VerticalBranchLine extends StatelessWidget {
  const VerticalBranchLine({Key? key, required this.size}) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes.branchThickness,
      height: size,
      color: AppColors.primaryColor,
    );
  }
}