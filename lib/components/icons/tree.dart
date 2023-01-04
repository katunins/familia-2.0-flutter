import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TreeIcon extends StatelessWidget {
  const TreeIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/icons/tree.svg');
  }
}
