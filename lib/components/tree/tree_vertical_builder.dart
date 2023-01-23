import 'package:familia_flutter/components/tree/tree_element.dart';
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

class TreeVerticalBuilder extends StatefulWidget {
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
  State<TreeVerticalBuilder> createState() => _TreeVerticalBuilderState();
}

class _TreeVerticalBuilderState extends State<TreeVerticalBuilder> {
  // final GlobalKey _rootKey = GlobalKey();
  // final GlobalKey _childColumnKey = GlobalKey();

  double shift = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      addUserToElementElementsStore();
    });
    super.initState();
  }

  addUserToElementElementsStore() {
    var familyTies = FamilyTies(rootUser: widget.rootUser);
    var nextUsers = widget.verticalDirection == AxisDirection.down ? familyTies.children : familyTies.parents;
    if (nextUsers.isNotEmpty) {
      // treeStore.setElementElements(userId: widget.rootUser.id, elements: nextUsers.map((e) => e.id).toList());
    }
  }

  // checkNeedSetCenterBalance() {
  //   var familyTies = FamilyTies(rootUser: widget.rootUser);
  //   var nextUsers = widget.verticalDirection == AxisDirection.down ? familyTies.children : familyTies.parents;
  //
  //   if (widget.alignment != CrossAxisAlignment.center || nextUsers.isEmpty && !widget.showRoot) {
  //     return;
  //   }
  //
  //   double xRootCenter = getCenterElementXPosition(containerKey: globalKey, childKey: _rootKey);
  //   GlobalKey? leftKey = treeStore.elementKeys[nextUsers.first.id];
  //   GlobalKey? rightKey = treeStore.elementKeys[nextUsers.last.id];
  //
  //   if (leftKey == null || rightKey == null) {
  //     throw FormatException('Ошибка построения древа');
  //   }
  //
  //   double leftElementCenter = getCenterElementXPosition(containerKey: globalKey, childKey: leftKey);
  //   double rightElementCenter = getCenterElementXPosition(containerKey: globalKey, childKey: rightKey);
  //
  //   double branchWidth = rightElementCenter - leftElementCenter;
  //   double branchCenter = leftElementCenter + branchWidth / 2;
  //
  //   double _shift = branchCenter - xRootCenter;
  //
  //   print('${widget.rootUser.title}  - $branchCenter - $xRootCenter - $_shift');
  //
  //   if (_shift != 0) {
  //     shift = _shift;
  //     setState(() {});
  //   }
  // }

  // EdgeInsets? get edgeInsets {
  //
  //   var rootKey = treeStore.elementKeys[widget.rootUser.id];
  //   var nextUsers = treeStore.elementElements[widget.rootUser.id];
  //
  //   if (rootKey == null || nextUsers == null || nextUsers.isEmpty) {
  //     return null;
  //   }
  //
  //   double xRootCenter = getCenterElementXPosition(containerKey: globalKey, childKey: rootKey);
  //   GlobalKey? leftKey = treeStore.elementKeys[nextUsers.first];
  //   GlobalKey? rightKey = treeStore.elementKeys[nextUsers.last];
  //
  //   if (leftKey == null || rightKey == null) {
  //     throw FormatException('Ошибка построения древа');
  //   }
  //
  //   double leftElementCenter = getCenterElementXPosition(containerKey: globalKey, childKey: leftKey);
  //   double rightElementCenter = getCenterElementXPosition(containerKey: globalKey, childKey: rightKey);
  //
  //   double branchWidth = rightElementCenter - leftElementCenter;
  //   double branchCenter = leftElementCenter + branchWidth / 2;
  //
  //   double _shift = branchCenter - xRootCenter;
  //   if (shift == 0) {
  //     return null;
  //   }
  //
  //   if (shift < 0) {
  //     return EdgeInsets.only(right: -shift * 2);
  //   } else {
  //     return EdgeInsets.only(left: shift * 2);
  //   }
  // }

  @override
  Widget build(BuildContext context) => Observer(builder: (_) {

        /// TODO вынести в initialState
        var familyTies = FamilyTies(rootUser: widget.rootUser);
        var nextUsers =
            widget.verticalDirection == AxisDirection.down ? familyTies.children : familyTies.parents;
        var columnWidgets = [
          if (widget.showRoot)
            Container(
              // margin: treeStore.elementEdgeInsets[widget.rootUser.id],
              // margin: edgeInsets,
              // key: _rootKey,
              child: TreeElement(user: widget.rootUser),
            ),
          // if (nextUsers.isNotEmpty)
          //   Container(
          //     // key: _childKey,
          //     // margin: edgeInsets,
          //     child: TreeHorizontalLineBlock(
          //         verticalDirection: widget.verticalDirection,
          //         alignment: widget.alignment,
          //         // key: GlobalKey(),
          //         elements: nextUsers,
          //         onPressed: (id) {}),
          //   ),
        ];

        if (widget.verticalDirection == AxisDirection.up) {
          columnWidgets = columnWidgets.reversed.toList();
        }

        return Column(
          crossAxisAlignment: widget.alignment,
          children: columnWidgets,
        );
      });
}
