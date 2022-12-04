import 'package:familia_flutter/components/branchLinePainter.dart';
import 'package:familia_flutter/components/relativeItemDescription.dart';
import 'package:familia_flutter/helpers/util.helper.dart';
import 'package:familia_flutter/models/relative.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final GlobalKey _containerKey = GlobalKey();
final Map<String, GlobalKey> parentsElementsKeys = {};

class RelativesLineBlock extends StatelessWidget {
  final List<RelativeModel> relatives;

  RelativesLineBlock({super.key, required this.relatives}) {
    // init elementsKeys
    for (var relative in relatives) {
      parentsElementsKeys[relative.id] = GlobalKey();
    }
  }

  // get relative X element position
  Map<String, double> getElementsXPositions(double? containerGlobalXPosition) {
    Map<String, double> result = {};
    if (containerGlobalXPosition == null) {
      return result;
    }
    for (var element in parentsElementsKeys.entries) {
      var dx = getRenderBox(element.value)?.localToGlobal(Offset.zero)?.dx;
      if (dx != null) {
        result[element.key] = containerGlobalXPosition - dx;
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    var containerRenderBox = getRenderBox(_containerKey);
    var elementsXPositions = getElementsXPositions(
        containerRenderBox?.localToGlobal(Offset.zero)?.dx);

    return Column(key: _containerKey, children: [
      if (containerRenderBox != null)
        BranchLinePainter(
          containerRenderBox: containerRenderBox,
          elementsXPositions: elementsXPositions,
        ) else Text('Loading'),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: relatives
              .map((item) => RelativeItemWithDescription(
            key: parentsElementsKeys[item.id],
            relative: item,
          ))
              .toList()),
    ]);
  }
}
