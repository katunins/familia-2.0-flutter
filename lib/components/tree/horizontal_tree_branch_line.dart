import 'package:familia_flutter/themes/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../stores/tree.store.dart';
import '../../themes/colors.dart';

class HorizontalTreeBranch extends StatelessWidget {
  const HorizontalTreeBranch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => Container(
              margin: EdgeInsets.only(top: treeStore.itemBlockWidth / 2),
              child: Container(
                width: AppSizes.minBranchLineSize,
                height: AppSizes.branchThickness,
                color: AppColors.primaryColor,
              ),
            ));
  }
}
