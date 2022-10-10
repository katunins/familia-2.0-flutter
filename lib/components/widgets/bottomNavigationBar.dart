import 'package:flutter/material.dart';

import '../../navigation/tabRoutes.dart';
import '../../stores/navigation.store.dart';
import '../../themes/colors.dart';

getBottomNavigationBar() => BottomAppBar(
      //bottom navigation bar on scaffold
      color: AppColors.greyColor,
      shape: const CircularNotchedRectangle(), //shape of notch
      notchMargin: 6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(
              Icons.photo_library_sharp,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          const SizedBox(
            width: 170,
          ),
          IconButton(
            icon: const Icon(Icons.supervised_user_circle_sharp,
                color: Colors.white),
            onPressed: () => navigationStore.setCurrentTab(TabRoutes.relatives),
          ),
        ],
      ),
    );
