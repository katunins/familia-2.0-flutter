import 'package:auto_route/auto_route.dart';
import 'package:familia_flutter/components/root/scaffold_wrapper.dart';
import 'package:familia_flutter/components/tree/tree_main_component.dart';
import 'package:familia_flutter/stores/tree.store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

final Map<String, GlobalKey> parentsElementsKeys = {}; // храниличе GlobalKey элементов списка

@RoutePage(name: 'TreeRouter')
class TreeScreen extends StatelessWidget {
  const TreeScreen({super.key});

  @override
  Widget build(BuildContext context) => Observer(
      builder: (_) => ScaffoldWrapper(
          title: treeStore.rootUser.title,
          body: Center(
              child: InteractiveViewer(
            constrained: false,
            child: const TreeRootComponent(),
          ))));
}
