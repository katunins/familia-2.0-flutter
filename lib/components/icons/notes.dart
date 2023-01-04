import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotesIcon extends StatelessWidget {
  const NotesIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/icons/notes.svg');
  }
}
