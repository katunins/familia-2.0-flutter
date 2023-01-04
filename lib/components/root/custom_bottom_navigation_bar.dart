import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../icons/notes.dart';
import '../icons/relatives.dart';
import '../icons/tree.dart';
import 'bottom_bar_button.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key, required this.tabsRouter})
      : super(key: key);
  final TabsRouter tabsRouter;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xfff1f1f1),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BottomBarButton(
              icon: const NotesIcon(),
              label: 'Альбом',
              index: 0,
              tabsRouter: tabsRouter),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 23),
            child: BottomBarButton(
                icon: const TreeIcon(),
                label: 'Древо',
                index: 1,
                tabsRouter: tabsRouter),
          ),
          BottomBarButton(
              icon: const RelativesIcon(),
              label: 'Семья',
              index: 2,
              tabsRouter: tabsRouter),
        ],
      ),
    );
  }
}
