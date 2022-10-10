import 'package:familia_flutter/components/widgets/removeSuffix.dart';
import 'package:familia_flutter/components/widgets/textFieldWidget.dart';
import 'package:familia_flutter/navigation/tabRoutes.dart';
import 'package:familia_flutter/stores/navigation.store.dart';
import 'package:familia_flutter/stores/user.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../main.dart';
import '../../themes/colors.dart';
import 'networkImage.dart';

const _padding = 20.0;

getAppBar(
    {hideUserPic = false,
      String? title,
      IconButton? leading,
      Widget? customTitle}) =>
    AppBar(
        centerTitle: false,
        titleSpacing: globalKey.currentState!.canPop() ? 0.0 : _padding,
        foregroundColor: AppColors.darkGreyColor,
        backgroundColor: Colors.transparent,
        title: customTitle ?? Text(title ?? ''),
        leading: leading,
        toolbarHeight: 60,
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
                        radius: 18,
                        backgroundImage: getNetworkImage(
                            userStore.user!.userData.userPic!))
                        : const Icon(
                      Icons.account_circle_rounded,
                      size: 32.0,
                    ),
                  ),
                ))
        ]);
