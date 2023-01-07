import 'package:flutter/material.dart';
import '../../themes/colors.dart';

class CheckBoxIcon extends StatelessWidget {
  const CheckBoxIcon({Key? key, required this.isChecked}) : super(key: key);

  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    return isChecked
        ? Icon(
            Icons.check_circle,
            color: AppColors.primaryColor,
          )
        : Icon(
            Icons.circle_outlined,
            color: AppColors.primaryColor,
          );
  }
}
