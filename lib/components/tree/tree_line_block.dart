import 'package:familia_flutter/components/tree/tree_element.dart';
import 'package:familia_flutter/components/tree/tree_vertical_builder.dart';
import 'package:familia_flutter/stores/tree.store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../helpers/family_ties.dart';
import '../../helpers/util.helper.dart';
import '../../models/tree_element.dart';
import 'branch_line_painter.dart';

/// блок для отрисовки элементов в одной линии древа
/// elements - элементы (дети или родители) юзера
/// verticalDirection - направление (ниже / выше основного юзера)
/// onPressed - клик на элемент древа

class TreeHorizontalLineBlock extends StatefulWidget {
  const TreeHorizontalLineBlock({
    super.key,
    required this.elements,
    this.onPressed,
    required this.verticalDirection,
    required this.alignment,
  });

  final List<TreeElementModel> elements;
  final Function(String userId)? onPressed;

  final AxisDirection verticalDirection;
  final CrossAxisAlignment alignment;

  @override
  State<TreeHorizontalLineBlock> createState() => _TreeHorizontalLineBlockState();
}

class _TreeHorizontalLineBlockState extends State<TreeHorizontalLineBlock> {
  final GlobalKey _containerKey = GlobalKey();
  RenderBox? containerRenderBox;
  bool readyToPaintLines = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      containerRenderBox = getRenderFromContext(context);
      readyToPaintLines = true;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Observer(builder: (_) {
        var childrenWidgets = <Widget>[
          if (readyToPaintLines)
            BranchLinePainter(
              containerRenderBox: containerRenderBox,
              elementsRenderBoxes:
                  treeStore.getRenderBoxes(widget.elements.map((element) => element.id).toList()),
              verticalDirection: widget.verticalDirection,
              alignment: widget.alignment,
            ),
          Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: widget.verticalDirection == AxisDirection.down
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.end,
              children: widget.elements.map((item) {
                var familyTies = FamilyTies(rootUser: item);
                if (familyTies.children.isNotEmpty) {
                  return TreeVerticalBuilder(
                    rootUser: item,
                    verticalDirection: widget.verticalDirection,
                    showRoot: true,
                    alignment: widget.alignment,
                  );
                }
                return TreeElement(user: item);
              }).toList()),
        ];

        if (widget.verticalDirection == AxisDirection.up) {
          childrenWidgets = childrenWidgets.reversed.toList();
        }

        return Column(
          crossAxisAlignment: widget.alignment,
          key: _containerKey,
          children: childrenWidgets,
        );
      });
}
