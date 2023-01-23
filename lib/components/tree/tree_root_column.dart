import 'package:familia_flutter/components/tree/tree_horizontal_builder.dart';
import 'package:familia_flutter/components/tree/tree_vertical_builder.dart';
import 'package:familia_flutter/helpers/family_ties.dart';
import 'package:familia_flutter/models/tree_element.dart';
import 'package:flutter/cupertino.dart';

class TreeRootColumn extends StatelessWidget {
  const TreeRootColumn({Key? key, required this.rootUser, required this.alignment}) : super(key: key);

  final TreeElementModel rootUser;
  final CrossAxisAlignment alignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        // TreeBlock(familyTies: FamilyTies(rootUser: rootUser), verticalDirection: AxisDirection.up, level: 0),
        TreeVerticalBuilder(
            rootUser: rootUser, verticalDirection: AxisDirection.up, showRoot: false, alignment: alignment),
        TreeHorizontalBuilder(
          rootUser: rootUser,
          elements: FamilyTies(rootUser: rootUser).sisterBrothers,
          alignment: alignment,
        ),
      ],
    );
  }
}
