import 'package:familia_flutter/components/tree/tree_root_column.dart';
import 'package:familia_flutter/components/tree/tree_vertical_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../stores/tree.store.dart';

class TreeRootComponent extends StatefulWidget {
  const TreeRootComponent({Key? key}) : super(key: key);

  @override
  State<TreeRootComponent> createState() => _TreeRootComponentState();
}

class _TreeRootComponentState extends State<TreeRootComponent> {

  double rightShift = 0;
  double leftShift = 0;

  final GlobalKey _rootBlockKey = GlobalKey();
  final GlobalKey _spouseBlockKey = GlobalKey();
  final GlobalKey _childrenBlockKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    if (twoColumnMode) {
      WidgetsBinding.instance.addPostFrameCallback(setChildrenShift);
    }
  }

  setChildrenShift(_) {
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
            Container(
                margin: EdgeInsets.only(left: leftShift, right: rightShift),
                child: TreeVerticalBuilder(
                    key: _childrenBlockKey,
                    rootUser: treeStore.rootUser,
                    verticalDirection: AxisDirection.down,
                    showRoot: false,
                    alignment: CrossAxisAlignment.center)),
          ],
        );
      });
}
