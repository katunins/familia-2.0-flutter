import 'package:familia_flutter/themes/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../themes/colors.dart';
import '../../stores/tree.store.dart';

class VerticalTreeBranchLine extends StatelessWidget {
  const VerticalTreeBranchLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => Container(
            margin: EdgeInsets.symmetric(horizontal: treeStore.itemBlockWidth / 2),
            child: Container(
              width: AppSizes.branchThickness,
              height: AppSizes.minBranchLineSize,
              color: AppColors.primaryColor,
            )));
  }
}
