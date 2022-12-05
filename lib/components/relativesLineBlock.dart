import 'dart:math';

import 'package:familia_flutter/components/branchLinePainter.dart';
import 'package:familia_flutter/components/relativeItemDescription.dart';
import 'package:familia_flutter/components/verticalBrachLine.dart';
import 'package:familia_flutter/helpers/util.helper.dart';
import 'package:familia_flutter/models/relative.model.dart';
import 'package:familia_flutter/models/treeElement.dart';
import 'package:familia_flutter/themes/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RelativesLineBlock extends StatefulWidget {
  final List<TreeElementModel> elements;
  final Function(String userId)? onPressed;

  final GlobalKey _containerKey = GlobalKey();
  final Map<String, GlobalKey> parentsElementsKeys = {};

  RelativesLineBlock({super.key, required this.elements, this.onPressed});

  @override
  State<RelativesLineBlock> createState() => _RelativesLineBlockState();
}

class _RelativesLineBlockState extends State<RelativesLineBlock> {

  bool buildIsReady = false;

  Map<String, RenderBox> getElementsRenderBoxes() {
    Map<String, RenderBox> result = {};

    for (var element in widget.parentsElementsKeys.entries) {
      var renderBox = getRenderBox(element.value);

      if (renderBox != null) {
        result[element.key] = renderBox;
      }
    }
    return result;
  }

  @override
  void initState() {
    for (var element in widget.elements) {
      if (widget.parentsElementsKeys[element.id] == null) {
        widget.parentsElementsKeys[element.id] = GlobalKey();
      }
    }



    WidgetsBinding.instance.addPostFrameCallback((_){
      setState(() {
        buildIsReady = true;
      });
    });

    super.initState();
  }

  // @override
  // void dispose() {
  //   parentsElementsKeys = {};
  //   buildIsReady = false;
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    var elementsRenderBoxes = getElementsRenderBoxes();
    var containerRenderBox = getRenderFromContext(context);

    return Column(key: widget._containerKey, children: [
      const VerticalBranchLine(),
      if (buildIsReady && containerRenderBox != null)
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          child: BranchLinePainter(
            containerRenderBox: containerRenderBox,
            elementsRenderBoxes: elementsRenderBoxes,
            direction: BranchDirection.down,
          ),
        ),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: widget.elements
              .map((item) => RelativeItemWithDescription(
                    key: widget.parentsElementsKeys[item.id],
                    title: item.title,
                    userPick: item.userPic,
                    userId: item.id,
                    onPressed: widget.onPressed,
                  ))
              .toList()),
    ]);
  }
}
