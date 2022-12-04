import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../themes/colors.dart';

enum IAppButtonTypes {
  primary,
  secondary,
  link,
}

class AppButton extends StatelessWidget {
  const AppButton(
      {Key? key,
      required this.title,
      this.onPressed,
      required this.type,
      this.disabled = false})
      : super(key: key);

  final String title;
  final VoidCallback? onPressed;
  final IAppButtonTypes type;
  final bool disabled;

  getAppButtonStyle() {
    var foregroundColor = MaterialStatePropertyAll(AppColors.whiteColor);
    var backgroundColor = MaterialStatePropertyAll(AppColors.primaryColor);
    var borderColor = AppColors.primaryColor;

    switch (type) {
      case IAppButtonTypes.primary:
        foregroundColor = MaterialStatePropertyAll(AppColors.whiteColor);
        backgroundColor = MaterialStatePropertyAll(AppColors.primaryColor);
        borderColor = AppColors.primaryColor;
        break;

      case IAppButtonTypes.secondary:
        foregroundColor = MaterialStatePropertyAll(AppColors.primaryColor);
        backgroundColor = MaterialStatePropertyAll(AppColors.whiteColor);
        borderColor = AppColors.primaryColor;
        break;

      case IAppButtonTypes.link:
        foregroundColor = MaterialStatePropertyAll(AppColors.primaryColor);
        backgroundColor = const MaterialStatePropertyAll(Colors.transparent);
        borderColor = Colors.transparent;
        break;
    }

    if (disabled) {
      foregroundColor = MaterialStatePropertyAll(AppColors.whiteColor);
      backgroundColor = MaterialStatePropertyAll(AppColors.lightGreyColor);
      borderColor = AppColors.lightGreyColor;
    }

    return ButtonStyle(
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        shadowColor: const MaterialStatePropertyAll(Colors.transparent),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: borderColor))));
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        style: getAppButtonStyle(),
        onPressed: disabled ? null : onPressed,
        child: Text(title),
      ),
    );
  }
}
