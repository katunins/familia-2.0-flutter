import 'package:familia_flutter/components/root/scaffold_wrapper.dart';
import 'package:familia_flutter/helpers/family_ties.dart';
import 'package:familia_flutter/models/tree_element.dart';
import 'package:familia_flutter/stores/user.store.dart';
import 'package:flutter/cupertino.dart';

import '../../components/relatives/relatives_line_block.dart';

class TreeScreen extends StatefulWidget {
  const TreeScreen({super.key, this.initialUser});

  final TreeElementModel? initialUser;

  @override
  State<TreeScreen> createState() => _TreeScreenState();
}

class _TreeScreenState extends State<TreeScreen> {

  late TreeElementModel user;

  @override
  void initState() {
    user = widget.initialUser ?? userStore.user!.toTreeElement();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      title: user.title,
      body: treeGenerator(user),
    );
  }
}

Widget treeGenerator(TreeElementModel user) {
  var familyTies = FamilyTies(rootUser: user);
  return RelativesLineBlock(elements: []);
}