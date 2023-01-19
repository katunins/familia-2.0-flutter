import 'package:familia_flutter/stores/tree.store.dart';
import 'package:familia_flutter/themes/colors.dart';
import 'package:familia_flutter/themes/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../helpers/util.helper.dart';

/// Компонент рендера веток между элементами
/// containerRenderBox - RenderBox контейнера - холста
/// elementsRenderBoxes - список RenderBoxes элементов слева на право (элемента может быть более двух)
/// verticalDirection - направление широкой частивверх - вниз
/// alignment - горизонтальное расположение
/// AppSizes.minBranchLineSize - высота ветки

class BranchLinePainter extends StatelessWidget {
  const BranchLinePainter({Key? key,
    this.shift = 0,
    required this.containerRenderBox,
    required this.elementsRenderBoxes,
    required this.verticalDirection,
    required this.alignment})
      : super(key: key);

  final RenderBox? containerRenderBox;
  final List<RenderBox> elementsRenderBoxes;
  final AxisDirection verticalDirection;
  final CrossAxisAlignment alignment;
  final double shift;

  @override
  Widget build(BuildContext context) => Observer(builder: (_){
    if (containerRenderBox == null || !treeStore.readyToPaintBranches) {
      return Container();
    }

    double containerHeight = AppSizes.minBranchLineSize;
    if (elementsRenderBoxes.length > 1) {
      containerHeight = containerHeight * 2;
    }

    return CustomPaint(
        size: Size(containerRenderBox!.size.width, containerHeight),
        painter: _BranchLinePainter(
            elementsRenderBoxes: elementsRenderBoxes,
            containerRenderBox: containerRenderBox!,
            verticalDirection: verticalDirection,
            alignment: alignment,
            shift: shift
        ));
  });
}

class _BranchLinePainter extends CustomPainter {
  _BranchLinePainter({required this.alignment,
    required this.shift,
    required this.containerRenderBox,
    required this.elementsRenderBoxes,
    required this.verticalDirection});

  final List<RenderBox> elementsRenderBoxes;
  final RenderBox containerRenderBox;
  final AxisDirection verticalDirection;
  final CrossAxisAlignment alignment;
  final double shift;

  final Path path = Path();

  double getCenterElementPositionX(RenderBox renderBox) {
    Offset offset = getRelativeOffset(containerRenderBox: containerRenderBox, child: renderBox);
    return offset.dx + renderBox.size.width / 2;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = AppColors.primaryColor
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round;

    // X позиции центра элементов
    var xLeftElement = getCenterElementPositionX(elementsRenderBoxes.first) + shift;
    var xRightElement = getCenterElementPositionX(elementsRenderBoxes.last) + shift;
    var xMiddle = xLeftElement + (xRightElement - xLeftElement)/2;

    // Y позциции низа, середины и верха контейнера
    var yStart = verticalDirection == AxisDirection.up ? 0.0 : size.height;
    var yMiddle = size.height / 2;
    var halfLineSize = size.height / 2;
    var yEnd = verticalDirection == AxisDirection.up ? size.height : 0.0;

    if (elementsRenderBoxes.length > 1) {
    switch (alignment) {
    // center
    case CrossAxisAlignment.center:
    path.moveTo(xMiddle, yMiddle);
    path.lineTo(xMiddle, yEnd);
    path.moveTo(xLeftElement, yStart);
    path.quadraticBezierTo(xLeftElement, yMiddle, xLeftElement + halfLineSize, yMiddle);
    path.lineTo(xRightElement - halfLineSize, yMiddle);
    path.quadraticBezierTo(xRightElement, yMiddle, xRightElement, yStart);
    break;
    // left
    case CrossAxisAlignment.start:
    path.moveTo(xLeftElement, yStart);
    path.lineTo(xLeftElement, yEnd);
    path.moveTo(xLeftElement, yMiddle);
    path.lineTo(xRightElement - halfLineSize, yMiddle);
    path.quadraticBezierTo(xRightElement, yMiddle, xRightElement, yStart);
    break;
    // right
    case CrossAxisAlignment.end:
    path.moveTo(xRightElement, yStart);
    path.lineTo(xRightElement, yEnd);
    path.moveTo(xRightElement, yMiddle);
    path.lineTo(xLeftElement + halfLineSize, yMiddle);
    path.quadraticBezierTo(xLeftElement, yMiddle, xLeftElement, yStart);
    break;
    default:
    break;
    }
    // К каждому элементу child отрисовать по ветке
    // if (elementsRenderBoxes.length> 2){
    //   for (var index = 1; index < elementsRenderBoxes.length - 1; index ++){
    //     var xItemElement = getCenterElementPositionX(elementsRenderBoxes[index]);
    //     path.moveTo(xItemElement, yMiddle);
    //     path.lineTo(xItemElement, yStart);
    //   }
    // }
    } else {
    path.moveTo(xLeftElement, yStart);
    path.lineTo(xLeftElement, yEnd);
    }
    canvas.drawPath(path, paint);
    }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
    // throw UnimplementedError();
  }
}
