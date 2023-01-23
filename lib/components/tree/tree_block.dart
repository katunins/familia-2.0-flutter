import 'package:familia_flutter/components/tree/branch_builder.dart';
import 'package:familia_flutter/components/tree/tree_element.dart';
import 'package:familia_flutter/components/tree/tree_elements_line.dart';
import 'package:familia_flutter/helpers/family_ties.dart';
import 'package:familia_flutter/helpers/util.helper.dart';
import 'package:familia_flutter/models/tree_element.dart';
import 'package:familia_flutter/stores/tree.store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TreeBlock extends StatefulWidget {
  const TreeBlock(
      {Key? key,
      required this.familyTies,
      required this.verticalDirection,
      required this.level,
      required this.afterBuildCallback})
      : super(key: key);

  // главный пользователь в блоке
  final FamilyTies familyTies;
  final int level;
  final AxisDirection verticalDirection;
  final Function afterBuildCallback;

  @override
  State<TreeBlock> createState() => _TreeBlockState();
}

class _TreeBlockState extends State<TreeBlock> {
  var elements = <TreeElementModel>[];
  double leftShift = 0;

  GlobalKey containerKey = GlobalKey();

  // выравнивает главного пользователя в блоке, относительно
  // его дочерних элементов
  alignment() {
    double? elementsCenterPosition = getElementsCenterPosition();
    double? userCenterPosition = getUserCenterPosition();
    if (elementsCenterPosition != null && userCenterPosition != null) {
      if (elementsCenterPosition != userCenterPosition) {
        leftShift = (elementsCenterPosition - userCenterPosition) * 2;
        setState(() {});
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          widget.afterBuildCallback();
        });
      }
    }
  }

  double? getElementsCenterPosition() {
    // расчитывает центральную X координату между двумя
    // центральными дочерними элементами относительно блока
    GlobalKey? key1 = treeStore.elementKeys[elements.first.id];
    GlobalKey? key2 = treeStore.elementKeys[elements.last.id];
    if (key1 != null && key2 != null) {
      var x1 = getCenterElementXPosition(containerKey: containerKey, childKey: key1);
      var x2 = getCenterElementXPosition(containerKey: containerKey, childKey: key2);
      if (x1 != null && x2 != null) {
        return x1 + (x2 - x1) / 2;
      }
    }
    return null;
  }

  double? getUserCenterPosition() {
    GlobalKey? key = treeStore.elementKeys[widget.familyTies.rootUser.id];
    if (key != null) {
      return getCenterElementXPosition(containerKey: containerKey, childKey: key);
    }
    return null;
  }

  @override
  void initState() {
    elements = widget.verticalDirection == AxisDirection.down
        ? widget.familyTies.children
        : widget.familyTies.parents;

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   // alignment();
    //   // widget.afterBuildCallback();
    // });
    super.initState();
  }

  // @override
  // void didUpdateWidget(covariant TreeBlock oldWidget) {
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     // alignment();
  //   });
  //   super.didUpdateWidget(oldWidget);
  // }

  @override
  Widget build(BuildContext context) =>Observer(builder: (_){

    List<Widget> children = [
      Padding(
          padding: EdgeInsets.only(left: leftShift),
          child: Column(
            children: [
              if (widget.level > 0) GestureDetector(
          onTap: ()=>treeStore.setRootUser(widget.familyTies.rootUser), child: TreeElement(user: widget.familyTies.rootUser)),
              BranchBuilder(
                  elementsRenderBoxes:
                  elements.map((element) => getRenderBox(treeStore.elementKeys[element.id])).toList(),
                  verticalDirection: widget.verticalDirection,
                  alignment: CrossAxisAlignment.center)
            ],
          )),
      TreeElementsLine(
          afterBuildCallback: alignment,
          elements: elements,
          verticalDirection: widget.verticalDirection,
          level: widget.level)
    ];

    if (widget.verticalDirection == AxisDirection.up) {
      children = children.reversed.toList();
    }

    return Column(
      key: containerKey,
      children: children,
    );
  });
}
