import 'package:familia_flutter/models/tree_element.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../stores/tree.store.dart';
import '../relatives/user_item_description.dart';

class TreeElement extends StatelessWidget {
  const TreeElement({Key? key, required this.user}) : super(key: key);

  final TreeElementModel user;

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => Container(
          margin: EdgeInsets.all(treeStore.paddingBetween),
          child: UserItemWithDescription(
            userPicSize: treeStore.userPicSize,
            horizontalPadding: treeStore.paddingBetween,
            fontSize: treeStore.itemFontSize,
            user: user,
          ),
        ));
  }
}
