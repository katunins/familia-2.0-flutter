import 'package:familia_flutter/components/tree/tree_block.dart';
import 'package:familia_flutter/components/tree/tree_element.dart';
import 'package:familia_flutter/stores/tree.store.dart';
import 'package:flutter/cupertino.dart';

import '../../helpers/family_ties.dart';
import '../../models/tree_element.dart';

/// блок для отрисовки элементов в одной линии древа
/// elements - элементы (дети или родители) юзера
/// verticalDirection - направление (ниже / выше основного юзера)
/// level - уровень погружения от корня

class TreeElementsLine extends StatefulWidget {
  const TreeElementsLine(
      {Key? key, required this.elements, required this.verticalDirection, required this.level, required this.afterBuildCallback})
      : super(key: key);

  final List<TreeElementModel> elements;
  final AxisDirection verticalDirection;
  final int level;
  final Function afterBuildCallback;

  @override
  State<TreeElementsLine> createState() => _TreeElementsLineState();
}

class _TreeElementsLineState extends State<TreeElementsLine> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.afterBuildCallback();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> children = widget.elements.map((user) {
      var familyTies = FamilyTies(rootUser: user);

      if ((widget.verticalDirection == AxisDirection.down && familyTies.children.isNotEmpty) ||
          (widget.verticalDirection == AxisDirection.up && familyTies.parents.isNotEmpty)) {
        return TreeBlock(
          afterBuildCallback: widget.afterBuildCallback,
            level: widget.level + 1, familyTies: FamilyTies(rootUser: user), verticalDirection: widget.verticalDirection);
      }
      return GestureDetector(
        onTap: ()=>treeStore.setRootUser(user),
        child: TreeElement(user: user),
      );
    }).toList();

    return Row(
      crossAxisAlignment:
      widget.verticalDirection == AxisDirection.down ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: children,
    );
  }
}