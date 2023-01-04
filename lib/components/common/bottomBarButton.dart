import 'package:auto_route/auto_route.dart';
import 'package:familia_flutter/themes/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBarButton extends StatelessWidget {
  const BottomBarButton(
      {Key? key,
      required this.icon,
      required this.label,
      required this.index,
      required this.tabsRouter})
      : super(key: key);

  final Widget icon;
  final String label;
  final int index;
  final TabsRouter tabsRouter;

  TextStyle? get _testStyle => index == tabsRouter.activeIndex
      ? TextStyle(color: AppColors.primaryColor, fontSize: 12)
      : const TextStyle(fontSize: 12);

  @override
  Widget build(BuildContext context) {

    double opacity = tabsRouter.activeIndex == index ? 1.0 : 0.4;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
            child: Opacity(opacity: opacity, child: icon), onTap: () => tabsRouter.setActiveIndex(index)),
        Text(label, style: _testStyle)
      ],
    );
  }
}
