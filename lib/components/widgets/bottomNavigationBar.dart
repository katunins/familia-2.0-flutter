import 'package:flutter/material.dart';
import '../../themes/colors.dart';

getBottomNavigationBar() => BottomAppBar(
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
            onPressed: () {},
          ),
        ],
      ),
    );
