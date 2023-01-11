import 'package:familia_flutter/models/tree_element.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../stores/tree.store.dart';
import '../relatives/user_item_description.dart';

class TreeElement extends StatefulWidget {
  const TreeElement({Key? key, required this.user}) : super(key: key);

  final TreeElementModel user;

  @override
  State<TreeElement> createState() => _TreeElementState();
}

class _TreeElementState extends State<TreeElement> {
  final GlobalKey _key = GlobalKey();

  @override
  void initState() {
    treeStore.setElementKey(userId: widget.user.id, globalKey: _key);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => Container(
              height: treeStore.treeElementHeight,
              margin: EdgeInsets.only(top: treeStore.paddingBetween),
              child: UserItemWithDescription(
                key: _key,
                userPicSize: treeStore.userPicSize,
                horizontalPadding: treeStore.paddingBetween,
                fontSize: 14,
                user: widget.user,
                // onPressed: (_) => treeStore.setRootUser(widget.user),
              ),
            ));
  }
}
