import 'package:flutter/cupertino.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton(
      {Key? key,
      required this.onTap,
      required this.icon,
      this.backgroundColor,
      this.iconColor,
      this.borderColor})
      : super(key: key);

  final Function() onTap;
  final IconData icon;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: borderColor == null ? null : Border.all(color: borderColor!),
          borderRadius: BorderRadius.circular(5),
          color: backgroundColor,
        ),
        padding: const EdgeInsets.all(7),
        child: Icon(icon, size: 25, color: iconColor),
      ),
    );
  }
}
