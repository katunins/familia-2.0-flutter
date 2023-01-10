import 'package:familia_flutter/config.dart';
import 'package:familia_flutter/themes/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum BranchElementPositionType { left, middle, right }

class BranchLinePainter extends StatelessWidget {

  const BranchLinePainter(
      {Key? key,
        required this.containerRenderBox,
        required this.elementsRenderBoxes,
        required this.verticalDirection})
      : super(key: key);

  final RenderBox? containerRenderBox;
  final Map<String, RenderBox> elementsRenderBoxes;
  final AxisDirection verticalDirection;

  @override
  Widget build(BuildContext context) {
    if (containerRenderBox == null) {
      return Container();
    }

    return CustomPaint(
        size: Size(containerRenderBox!.size.width, Config.branchLineHeight),
        painter: _BranchLinePainter(
            elementsRenderBoxes: elementsRenderBoxes,
            containerRenderBox: containerRenderBox!,
            verticalDirection: verticalDirection)
    );
  }
}

class _BranchLinePainter extends CustomPainter {

  _BranchLinePainter(
      {required this.containerRenderBox,
      required this.elementsRenderBoxes,
      required this.verticalDirection});

  final Map<String, RenderBox> elementsRenderBoxes;
  final RenderBox containerRenderBox;
  final AxisDirection verticalDirection;

  // get Offset relative parent widget
  Offset getRelativeOffset(RenderBox child) {
    Offset childOffset = child.localToGlobal(Offset.zero);
    return containerRenderBox.globalToLocal(childOffset);
  }

  getPositionType(MapEntry<String, RenderBox> item) {
    if (elementsRenderBoxes.length == 1) {
      return BranchElementPositionType.middle;
    }

    if (item.key == elementsRenderBoxes.keys.first) {
      return BranchElementPositionType.left;
    }

    if (item.key == elementsRenderBoxes.keys.last) {
      return BranchElementPositionType.right;
    }

    return BranchElementPositionType.middle;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = AppColors.primaryColor
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round;

    var path = Path();
    for (var item in elementsRenderBoxes.entries) {
      var xPosition = getRelativeOffset(item.value);

      // x - центр элемента
      var centerX = xPosition.dx + item.value.size.width / 2;
      var type = getPositionType(item);

      var yStart = verticalDirection == AxisDirection.up ? 0.0 : size.height;
      var yEnd = verticalDirection == AxisDirection.up ? size.height : 0.0;

      path.moveTo(centerX, yStart);

      switch (type) {
        case BranchElementPositionType.left:
          path.quadraticBezierTo(centerX, yEnd, centerX + size.height, yEnd);
          path.lineTo(containerRenderBox.size.width / 2, yEnd);
          break;
        case BranchElementPositionType.right:
          path.quadraticBezierTo(centerX, yEnd, centerX - size.height, yEnd);
          path.lineTo(containerRenderBox.size.width / 2, yEnd);
          break;
        default:
          path.lineTo(centerX, yEnd);
      }
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
