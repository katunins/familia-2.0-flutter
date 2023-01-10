import 'package:familia_flutter/components/root/scaffold_wrapper.dart';
import 'package:familia_flutter/components/tree/tree_root_column.dart';
import 'package:familia_flutter/helpers/family_ties.dart';
import 'package:familia_flutter/stores/tree.store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../components/common/free_scroll.dart';

final Map<String, GlobalKey> parentsElementsKeys = {}; // храниличе GlobalKey элементов списка

class TreeScreen extends StatelessWidget {
  TreeScreen({super.key});

  final familyTies = FamilyTies(rootUser: treeStore.rootUser);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      title: treeStore.rootUser.title,
      body: Observer(
          builder: (_) => Center(
                child: FreeScrollView(
                  child: TreeRootColumn(rootUser: treeStore.rootUser, alignment: CrossAxisAlignment.end),
                ),
              )),
    );
  }
}