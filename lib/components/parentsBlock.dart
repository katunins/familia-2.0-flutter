import 'package:familia_flutter/components/branch.dart';
import 'package:familia_flutter/components/relativeItemDescription.dart';
import 'package:familia_flutter/models/parents.model.dart';
import 'package:flex_with_main_child/flex_with_main_child.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../stores/relatives.store.dart';

final GlobalKey _globalParentsKey = GlobalKey();
final Map<String, GlobalKey> _globalKeyArr = {};

class ParentsBlock extends StatelessWidget {
  const ParentsBlock({Key? key, required this.parents}) : super(key: key);

  final ParentsModel parents;

  getParentsRow() {
    return Row(
        key: _globalParentsKey,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [...parents.toList(), ...parents.toList()].map((relativeId) {

          _globalKeyArr[relativeId] = GlobalKey();
          var relative = relativesStore.getRelativeById(relativeId);

          return RelativeItemWithDescription(
            key: _globalKeyArr[relativeId],
            relative: relative!,
            margin: const EdgeInsets.symmetric(horizontal: 20),
          );
        }).toList());
  }

  @override
  Widget build(BuildContext context) {

    getParentsWidth(){
      var currentContext = _globalParentsKey.currentContext;
      if (currentContext == null) {
        return 0.0;
      }
      RenderBox box = currentContext!.findRenderObject() as RenderBox;
      return box.size.width;
    }
    // RenderBox box = _globalKeyArr['627e546206f77c001d7616d9'].currentContext!.findRenderObject() as RenderBox;
    // Offset position = box.localToGlobal(Offset.zero); //this is global position
    // double y = position.dy; //this is y - I think it's

    // print(box.);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
        // color: Colors.lightGreen,
        child: Column(
        // child: FlexWithMainChild(
        //     direction: Axis.vertical,
        //     mainChildKey: _globalParentsKey,
            children: [
              Branch(
                width: getParentsWidth(),
              ),
              getParentsRow(),
            ])
            );
  }
}
