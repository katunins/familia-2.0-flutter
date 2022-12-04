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
            icon: Icon(
              Icons.photo_library_sharp,
              color: AppColors.whiteColor,
            ),
            onPressed: () {},
          ),
          const SizedBox(
            width: 170,
          ),
          IconButton(
            icon: Icon(Icons.supervised_user_circle_sharp,
                color: AppColors.whiteColor),
            onPressed: () => navigationStore.setCurrentTab(TabRoutes.relatives),
          ),
        ],
      ),
    );
