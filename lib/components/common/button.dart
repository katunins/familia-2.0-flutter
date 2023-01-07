import 'package:familia_flutter/components/widgets/progeres_indicator.dart';
import 'package:flutter/material.dart';
import '../../../themes/colors.dart';
import '../../themes/sizes.dart';

enum IAppButtonTypes {
  primary,
  secondary,
  link,
}

class AppButton extends StatelessWidget {
  const AppButton(
      {Key? key,
      required this.title,
      required this.onPressed,
      required this.type,
      this.isLoading = false,
      this.disabled = false,
      this.icon})
      : super(key: key);

  final String title;
  final VoidCallback? onPressed;
  final IAppButtonTypes type;
  final bool disabled;
  final Widget? icon;
  final bool isLoading;

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

    if (disabled || isLoading) {
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
        onPressed: disabled  || isLoading ? null : onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null && !isLoading)
              Container(
                margin: EdgeInsets.only(right: AppSizes.marginHorizontal),
                child: icon!,
              ),
            isLoading ? AppProgressIndicator(color: AppColors.whiteColor) : Text(title)
          ],
        ),
      ),
    );
  }
}
