import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RelativesIcon extends StatelessWidget {
  const RelativesIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/icons/relatives.svg');
  }
}
