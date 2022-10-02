import 'package:familia_flutter/components/widgets/imageWidget.dart';
import 'package:familia_flutter/routes.dart';
import 'package:familia_flutter/stores/navigation.store.dart';
import 'package:familia_flutter/stores/user.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../screens/profileScreen/profileScreen.dart';
import '../../themes/colors.dart';
import 'networkImage.dart';

const _padding = 20.0;

getAppBar({hideUserPic = false, String? title}) => AppBar(
      centerTitle: false,
      titleSpacing: navigationStore.globalKey.currentState!.canPop() ? 0.0 : _padding,
      foregroundColor: AppColors.darkGreyColor,
      backgroundColor: Colors.transparent,
      title: GestureDetector(
        child: Text(title ?? 'Familia'),
      ),
      actions: [
        if (!hideUserPic)
          Padding(
              padding: const EdgeInsets.only(right: _padding),
              child: Observer(builder: (_)=>GestureDetector(
                onTap: () => navigationStore.push(ProfileScreen.routeName),
                child: userStore.user?.userData?.userPic != null
                    ? CircleAvatar(
                    backgroundImage:
                    getNetworkImage(userStore.user!.userData.userPic!))
                    : const Icon(Icons.account_circle_rounded),
              ),))
      ],
    );
