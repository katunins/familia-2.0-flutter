import 'package:familia_flutter/components/branchLinePainter.dart';
import 'package:familia_flutter/components/relativeItemDescription.dart';
import 'package:familia_flutter/components/verticalBrachLine.dart';
import 'package:familia_flutter/helpers/util.helper.dart';
import 'package:familia_flutter/models/relative.model.dart';
import 'package:familia_flutter/models/treeElement.dart';
import 'package:familia_flutter/themes/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final GlobalKey _containerKey = GlobalKey();
final Map<String, GlobalKey> parentsElementsKeys = {};

class RelativesLineBlock extends StatefulWidget {
  final List<TreeElementModel> elements;

  RelativesLineBlock({super.key, required this.elements}) {
    // init elementsKeys
    for (var element in elements) {
      parentsElementsKeys[element.id] = GlobalKey();
    }
  }

  @override
  State<RelativesLineBlock> createState() => _RelativesLineBlockState();
}

class _RelativesLineBlockState extends State<RelativesLineBlock> {
  RenderBox? containerRenderBox;

  // get RenderBoxes for elements positions
  Map<String, RenderBox> getElementsRenderBoxes() {
    Map<String, RenderBox> result = {};
    if (containerRenderBox == null) {
      return result;
    }

    for (var element in parentsElementsKeys.entries) {
      var renderBox = getRenderBox(element.value);
      if (renderBox != null) {
        result[element.key] = renderBox;
      }
    }
    return result;
  }

  @override
  void initState() {
    // calculate containers params after render
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        containerRenderBox = getRenderBox(_containerKey);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var elementsRenderBoxes = getElementsRenderBoxes();

    return Column(key: _containerKey, children: [
      const VerticalBranchLine(),
      if (containerRenderBox != null)
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          child: BranchLinePainter(
            containerRenderBox: containerRenderBox!,
            elementsRenderBoxes: elementsRenderBoxes,
            direction: BranchDirection.down,
          ),
        ),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: widget.elements
              .map((item) => RelativeItemWithDescription(
                    key: parentsElementsKeys[item.id],
                    title: item.title,
                    userPick: item.userPic,
                  ))
              .toList()),
    ]);
  }
}
