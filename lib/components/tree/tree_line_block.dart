import 'package:familia_flutter/components/tree/tree_element.dart';
import 'package:familia_flutter/components/tree/tree_vertical_builder.dart';
import 'package:familia_flutter/main.dart';
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
  // final GlobalKey _containerKey = GlobalKey();
  // final GlobalKey _rowKey = GlobalKey();

  RenderBox? containerRenderBox;
  bool readyToPaintLines = false;

  // double shift = 0;

  // double leftShift = 0;
  // double rightShift = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      containerRenderBox = getRenderFromContext(context);
      // checkNeedSetCenterBalance();
      readyToPaintLines = true;
      setState(() {});
    });
    super.initState();
  }

  // checkNeedSetCenterBalance(){
  //   if (widget.elements.length > 1 && widget.alignment == CrossAxisAlignment.center){
  //
  //     double xRootCenter = getCenterElementXPosition(containerKey: globalKey, childKey: widget.rootKey);
  //
  //     GlobalKey? leftKey = treeStore.elementKeys[widget.elements.first.id];
  //     GlobalKey? rightKey = treeStore.elementKeys[widget.elements.last.id];
  //
  //     if (leftKey == null || rightKey == null){
  //       return;
  //     }
  //
  //     double leftElementCenter = getCenterElementXPosition(containerKey: globalKey, childKey: leftKey);
  //     double rightElementCenter = getCenterElementXPosition(containerKey: globalKey, childKey: rightKey);
  //
  //     double branchWidth = rightElementCenter - leftElementCenter;
  //     double branchCenter = leftElementCenter + branchWidth / 2;
  //
  //     double _shift = xRootCenter - branchCenter;
  //
  //     print('$branchCenter - $xRootCenter - $_shift');
  //
  //     if (_shift != 0) {
  //       shift = _shift;
  //       setState(() {});
  //       // setCenterBalance(shift * 2);
  //     }
  //   }
  // }

  // EdgeInsets getEdgeInsets(){
  //   if (shift < 0) {
  //     return EdgeInsets.only(right: -shift);
  //   } else {
  //     return EdgeInsets.only(left: shift);
  //   }
  // }

  // setCenterBalance(shift){
  //   if (shift < 0) {
  //     rightShift = -shift;
  //   } else {
  //     leftShift = shift;
  //   }
  //   setState(() {});
  //   // var childCenter = getCenterElementXPosition(containerKey: _containerKey, childKey: _rowKey);
  //   // RenderBox? rowRenderBox = getRenderBox(_rowKey);
  //   // print(childCenter);
  //   // print(rowRenderBox?.size.width);
  // }

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
              // shift: shift,
            ),
    Container(
    // padding: getEdgeInsets(),
    child: Row(
            // key: _rowKey,
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
              }).toList())),
        ];

        if (widget.verticalDirection == AxisDirection.up) {
          childrenWidgets = childrenWidgets.reversed.toList();
        }

        return Column(
            crossAxisAlignment: widget.alignment,
            children: childrenWidgets,
          );
      });
}
