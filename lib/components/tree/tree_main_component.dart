import 'package:familia_flutter/components/tree/tree_block.dart';
import 'package:familia_flutter/components/tree/tree_root_column.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../helpers/family_ties.dart';
import '../../stores/tree.store.dart';

class TreeRootComponent extends StatefulWidget {
  const TreeRootComponent({Key? key}) : super(key: key);

  @override
  State<TreeRootComponent> createState() => _TreeRootComponentState();
}

class _TreeRootComponentState extends State<TreeRootComponent> {
  double rightShift = 0;
  double leftShift = 0;
  double leftChildrenShift = 0;

  final GlobalKey _rootBlockKey = GlobalKey();
  final GlobalKey _spouseBlockKey = GlobalKey();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(afterBuildTree);
    super.initState();
  }

  afterBuildTree(_) {
    if (twoColumnMode) {
      _shiftRootSpouseContainers();
    }
    _shiftTopBottomContainers();
    // treeStore.setReadyToPaintBranches();
  }

  //  Если нижний контейнер с детьми не симметричный, то сдвинем верхний контейнер
  _shiftTopBottomContainers() {}

  // делает левый и правый контейнер равными по ширине
  _shiftRootSpouseContainers() {
    var rootWidth = _rootBlockKey.currentContext?.size?.width ?? 0;
    var spouseWidth = _spouseBlockKey.currentContext?.size?.width ?? 0;
    var different = spouseWidth - rootWidth;
    if (different > 0) {
      rightShift = different;
    } else {
      leftShift = -different;
    }
    setState(() {});
  }

  // bool get twoColumnMode => false;
  bool get twoColumnMode => treeStore.rootFamilyTies.spouses.isNotEmpty;

  @override
  Widget build(BuildContext context) => Observer(builder: (_) {
        return Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TreeRootColumn(
                    key: _rootBlockKey,
                    rootUser: treeStore.rootUser,
                    alignment: twoColumnMode ? CrossAxisAlignment.end : CrossAxisAlignment.center),
                if (twoColumnMode)
                  TreeRootColumn(
                      key: _spouseBlockKey,
                      rootUser: treeStore.rootFamilyTies.spouses.first,
                      alignment: CrossAxisAlignment.start),
              ],
            ),
            TreeBlock(
              afterBuildCallback: (){},
                level: 0,
                familyTies: FamilyTies(rootUser: treeStore.rootUser),
                verticalDirection: AxisDirection.down),
          ],
        );
      });
}
