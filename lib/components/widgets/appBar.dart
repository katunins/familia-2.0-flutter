import 'package:familia_flutter/components/widgets/imageWidget.dart';
import 'package:familia_flutter/navigation/tabRoutes.dart';
import 'package:familia_flutter/stores/app.store.dart';
import 'package:familia_flutter/stores/navigation.store.dart';
import 'package:familia_flutter/stores/user.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../main.dart';
import '../../screens/profileScreen/profileScreen.dart';
import '../../themes/colors.dart';
import 'networkImage.dart';

const _padding = 20.0;

getAppBar({hideUserPic = false, String? title, IconButton? leading}) => AppBar(
        centerTitle: false,
        titleSpacing: globalKey.currentState!.canPop() ? 0.0 : _padding,
        foregroundColor: AppColors.darkGreyColor,
        backgroundColor: Colors.transparent,
        title: Text(title ?? ''),
        leading: leading,
        actions: [
          if (!hideUserPic)
            Padding(
                padding: const EdgeInsets.only(right: _padding),
                child: Observer(
                  builder: (_) => GestureDetector(
                    onTap: () =>
                        navigationStore.setCurrentTab(TabRoutes.profile),
                    child: userStore.user?.userData?.userPic != null
                        ? CircleAvatar(
                            backgroundImage: getNetworkImage(
                                userStore.user!.userData.userPic!))
                        : const Icon(Icons.account_circle_rounded, size: 32.0,),
                  ),
                ))
        ]);
