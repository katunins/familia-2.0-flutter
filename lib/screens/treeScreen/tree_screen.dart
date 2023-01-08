import 'package:familia_flutter/components/root/scaffold_wrapper.dart';
import 'package:familia_flutter/models/tree_element.dart';
import 'package:familia_flutter/stores/family_tires.store.dart';
import 'package:familia_flutter/stores/user.store.dart';
import 'package:flutter/cupertino.dart';

import '../../components/relatives/relatives_line_block.dart';

class TreeScreen extends StatefulWidget {
  const TreeScreen({Key? key}) : super(key: key);

  @override
  State<TreeScreen> createState() => _TreeScreenState();
}

class _TreeScreenState extends State<TreeScreen> {

  FamilyTreesStore store = FamilyTreesStore(userStore.user!.toTreeElement());


  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      title: store.rootUser.title,
      body: treeGenerator(store.rootUser),
    );
  }
}

Widget treeGenerator(TreeElementModel user) {

  return RelativesLineBlock(elements: []);
}
