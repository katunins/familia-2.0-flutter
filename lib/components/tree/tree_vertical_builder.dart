import 'package:familia_flutter/components/tree/tree_element.dart';
import 'package:familia_flutter/components/tree/tree_line_block.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../helpers/family_ties.dart';
import '../../models/tree_element.dart';

/// компонент построения вертикального и горизонтального древа
/// должен учавствовать в рекурсивной функции
/// rootUser - пользователь, от которого идет построение;
/// verticalDirection - направление древа;
/// showRoot - показывать / скрывать пользователя. нужно передавать false для первого уровня,
/// если rootUser всего древа вывадится отдельным компонентом;

class TreeVerticalBuilder extends StatelessWidget {
  const TreeVerticalBuilder(
      {Key? key,
      required this.verticalDirection,
      required this.showRoot,
      required this.rootUser,
      required this.alignment})
      : super(key: key);

  final TreeElementModel rootUser;
  final AxisDirection verticalDirection;
  final bool showRoot;
  final CrossAxisAlignment alignment;

  @override
  Widget build(BuildContext context) => Observer(builder: (_) {
        var familyTies = FamilyTies(rootUser: rootUser);
        var nextUsers = verticalDirection == AxisDirection.down ? familyTies.children : familyTies.parents;

        var columnWidgets = [
          if (showRoot) TreeElement(user: rootUser),
          if (nextUsers.isNotEmpty)
            TreeHorizontalLineBlock(
                verticalDirection: verticalDirection,
                alignment: alignment,
                key: GlobalKey(),
                elements: nextUsers,
                onPressed: (id) {}),
        ];

        if (verticalDirection == AxisDirection.up) {
          columnWidgets = columnWidgets.reversed.toList();
        }

        return Column(
          crossAxisAlignment: alignment,
          children: columnWidgets,
        );
      });
}
