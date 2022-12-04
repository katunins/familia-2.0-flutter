import 'package:familia_flutter/config.dart';
import 'package:familia_flutter/helpers/util.helper.dart';
import 'package:familia_flutter/themes/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BranchLinePainter extends StatelessWidget {
  const BranchLinePainter(
      {Key? key,
      required this.containerRenderBox,
      required this.elementsXPositions})
      : super(key: key);

  final RenderBox containerRenderBox;
  final Map<String, double> elementsXPositions;

  @override
  Widget build(BuildContext context) {


    return CustomPaint(
      size: Size(containerRenderBox.size.width, Config.branchLineHeight),
      painter: _BranchLinePainterPainter(elementsXPositions),
    );
  }
}

class _BranchLinePainterPainter extends CustomPainter {
  _BranchLinePainterPainter(this.xPositions);

  final Map<String, double> xPositions;

  @override
  void paint(Canvas canvas, Size size) {

    var paint = Paint()
      ..color = AppColors.primaryColor
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round;

    var path = Path();
    for(var xPosition in xPositions.entries){
      var middleX =
      path.moveTo(xPosition.value, size.height);
      path.lineTo(xPosition.value, 0);
    }
    // path.moveTo(0, size.height);
    // path.lineTo(100, size.height);
    // ..moveTo(0, 0)
    // ..lineTo(size.width, 0);
    // ..moveTo(size.width / 2, 0)
    // ..lineTo(10, 0)
    // ..quadraticBezierTo(0, 0, 0, 10);
    // ..lineTo(size.width, size.height / 2);
    canvas.drawPath(path, paint);
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
    // throw UnimplementedError();
  }
}
