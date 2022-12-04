import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const thickness = 2.0;
const height = 20.0;
const radius = 15;

class Branch extends StatelessWidget {
  const Branch({Key? key, required this.width}) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {

    return CustomPaint(
      // size: Size.fromHeight(20),
      size: Size(width, 20),
      painter: BranchPainter(),
    );
  }
}

class BranchPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round;

    var path = Path()
    ..moveTo(0, 0)
      ..lineTo(size.width, 0);
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

getRightConner() {
  return Container();
}
