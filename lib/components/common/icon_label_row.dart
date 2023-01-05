import 'package:familia_flutter/themes/colors.dart';
import 'package:flutter/material.dart';

import '../../themes/margins.theme.dart';

class IconLabelRow extends StatelessWidget {
  const IconLabelRow(
      {Key? key,
      required this.label,
      required this.icon,
      required this.isChecked,
      this.onTap})
      : super(key: key);

  final String label;
  final Widget icon;
  final bool isChecked;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: GestureDetector(
          onTap: onTap,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              icon,
              Container(
                margin: EdgeInsets.symmetric(horizontal: marginHorizontal),
                width: 220,
                child: Text(label),
              ),
              isChecked
                  ? Icon(
                      Icons.check_circle,
                      color: AppColors.primaryColor,
                    )
                  : Icon(
                      Icons.circle_outlined,
                      color: AppColors.primaryColor,
                    )
            ],
          ),
        ));
  }
}
