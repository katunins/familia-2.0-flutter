import 'package:familia_flutter/components/tree/tree_element.dart';
import 'package:familia_flutter/components/tree/tree_vertical_builder.dart';
import 'package:familia_flutter/components/tree/vertical_tree_branch_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../helpers/family_ties.dart';
import '../../models/tree_element.dart';

/// блок для отрисовки элементов в одной линии древа
/// elements - элементы (дети или родители) юзера
/// verticalDirection - направление (ниже / выше основного юзера)
/// onPressed - клик на элемент древа

class TreeHorizontalLineBlock extends StatelessWidget {
  TreeHorizontalLineBlock({
    super.key,
    required this.elements,
    this.onPressed,
    required this.verticalDirection,
    required this.alignment,
  });

  final List<TreeElementModel> elements;
  final Function(String userId)? onPressed;

  final GlobalKey _containerKey = GlobalKey();
  final AxisDirection verticalDirection;
  final CrossAxisAlignment alignment;

  @override
  Widget build(BuildContext context) => Observer(builder: (_) {
        var childrenWidgets = <Widget>[
          const VerticalTreeBranchLine(),
          Row(
            mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment:
                  verticalDirection == AxisDirection.down ? CrossAxisAlignment.start : CrossAxisAlignment.end,
              children: elements.map((item) {
                var familyTies = FamilyTies(rootUser: item);
                if (familyTies.children.isNotEmpty) {
                  return TreeVerticalBuilder(
                    rootUser: item,
                    verticalDirection: verticalDirection,
                    showRoot: true,
                    alignment: alignment,
                  );
                }
                return TreeElement(user: item);
              }).toList()),
        ];

        if (verticalDirection == AxisDirection.up) {
          childrenWidgets = childrenWidgets.reversed.toList();
        }

        return Column(
          crossAxisAlignment: alignment,
          key: _containerKey,
          children: childrenWidgets,
        );
      });
}
