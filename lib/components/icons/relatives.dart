import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RelativesIcon extends StatelessWidget {
  const RelativesIcon({Key? key, this.color}) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/icons/relatives.svg', color: color);
  }
}
