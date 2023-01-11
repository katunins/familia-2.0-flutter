import 'package:familia_flutter/components/root/scaffold_wrapper.dart';
import 'package:familia_flutter/components/tree/tree_root_column.dart';
import 'package:familia_flutter/helpers/family_ties.dart';
import 'package:familia_flutter/stores/tree.store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../components/common/free_scroll.dart';
import '../../components/tree/tree_vertical_builder.dart';

final Map<String, GlobalKey> parentsElementsKeys = {}; // храниличе GlobalKey элементов списка

class TreeScreen extends StatefulWidget {
  const TreeScreen({super.key});

  @override
  State<TreeScreen> createState() => _TreeScreenState();
}

class _TreeScreenState extends State<TreeScreen> {
  final familyTies = FamilyTies(rootUser: treeStore.rootUser);
  double rightShift = 0;
  double leftShift = 0;

  final GlobalKey _rootBlockKey = GlobalKey();
  final GlobalKey _spouseBlockKey = GlobalKey();
  final GlobalKey _childrenBlockKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    if (twoColumnMode) {
      Future.delayed(Duration.zero, setChildrenShift);
    }
  }

  setChildrenShift() {
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

  bool get twoColumnMode => familyTies.spouses.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      title: treeStore.rootUser.title,
      body: Observer(
          builder: (_) => Center(
                child: FreeScrollView(
                  child: Column(
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
                                rootUser: familyTies.spouses.first,
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
                  ),
                ),
              )),
    );
  }
}
