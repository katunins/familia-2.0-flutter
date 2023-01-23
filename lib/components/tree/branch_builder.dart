import 'package:familia_flutter/themes/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../helpers/util.helper.dart';
import '../../main.dart';
import '../../themes/colors.dart';

/// Компонент веток древа
/// elementsRenderBoxes - список RenderBox элементов, к которым идут ветки
/// в elementsRenderBoxes - подерживается 1 пользователь
/// verticalDirection - вертикальное направление ветки
/// alignment - сторона, к которой прижимается ветка

const branchHeight = 30.0;

class BranchBuilder extends StatelessWidget {
  const BranchBuilder(
      {Key? key, required this.elementsRenderBoxes, required this.verticalDirection, required this.alignment})
      : super(key: key);

  final List<RenderBox?> elementsRenderBoxes;
  final AxisDirection verticalDirection;
  final CrossAxisAlignment alignment;

  double? _getCenterElementPositionX(RenderBox renderBox) {
    RenderBox? containerRenderBox = getRenderBox(globalKey);
    if (containerRenderBox == null) {
      return null;
    }
    Offset offset = getRelativeOffset(containerRenderBox: containerRenderBox, child: renderBox);
    return offset.dx + renderBox.size.width / 2;
  }

  String getSvgPath(String data) =>
      '<path d="$data" stroke="${getHexColor(AppColors.primaryColor)}" stroke-width="${AppSizes.branchThickness}"/>';

  double? get width {
    RenderBox? leftRenderBox = elementsRenderBoxes.first;
    RenderBox? rightRenderBox = elementsRenderBoxes.last;

    if (leftRenderBox == null || rightRenderBox == null) {
      return null;
    }

    var xLeftElement = _getCenterElementPositionX(leftRenderBox);
    var xRightElement = _getCenterElementPositionX(rightRenderBox);

    if (xLeftElement == null || xRightElement == null) {
      return null;
    }

    return elementsRenderBoxes.length == 1 ? AppSizes.branchThickness : xRightElement - xLeftElement;
  }

  double get halfHeight => branchHeight / 2;

  double get yStart => verticalDirection == AxisDirection.down ? 0 : branchHeight;

  double get xMiddleLineStart {
    switch (alignment) {
      case CrossAxisAlignment.start:
        return 0;
      case CrossAxisAlignment.end:
        return width!;
      default:
        return halfHeight;
    }
  }

  double get xMiddleLineEnd {
    switch (alignment) {
      case CrossAxisAlignment.start:
        return width!;
      case CrossAxisAlignment.end:
        return 0;
      default:
        return width! - halfHeight;
    }
  }

  double get yEnd => verticalDirection == AxisDirection.down ? branchHeight : 0;

  String get middleLine => getSvgPath('M$xMiddleLineStart,$halfHeight'
      'L$xMiddleLineEnd,$halfHeight');

  String get verticalLine {
    if (elementsRenderBoxes.length == 1){
      return getSvgPath('M1,0 L1,$branchHeight');
    }
    switch (alignment) {
      case CrossAxisAlignment.center:
        return getSvgPath('M${width! / 2},$halfHeight L${width! / 2},$yStart');
      case CrossAxisAlignment.start:
        return getSvgPath('M1,0 L1,$branchHeight');
      case CrossAxisAlignment.end:
        return getSvgPath('M$width-1,0 L$width-1,$branchHeight');
      default:
        return '';
    }
  }

  String get leftConner => getSvgPath('M$halfHeight,$halfHeight Q1,$halfHeight 1,$yEnd');

  String get rightConner =>
      getSvgPath('M${width! -1 -halfHeight},$halfHeight Q${width! - 1},$halfHeight ${width! -1}, $yEnd');

  @override
  Widget build(BuildContext context) {
    if (width == null) {
      return Container();
    }

    String body = verticalLine;

    if (elementsRenderBoxes.length > 1) body += middleLine;

    switch (alignment) {
      case CrossAxisAlignment.center:
        body += '$leftConner $rightConner';
        break;
      case CrossAxisAlignment.start:
        body += '$leftConner $verticalLine';
        break;
      case CrossAxisAlignment.end:
        body += '$verticalLine $rightConner';
        break;
      default:
        break;
    }

    return SvgPicture.string(
        '<svg width="$width" height="$branchHeight" viewBox="0 0 $width $branchHeight" fill="none">$body</svg>');
  }
}
