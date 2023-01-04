import 'package:auto_route/auto_route.dart';
import 'package:familia_flutter/themes/margins.theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../helpers/util.helper.dart';
import '../../stores/user.store.dart';

class ProfileUserPic extends StatelessWidget {
  const ProfileUserPic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabsRouter = AutoTabsRouter.of(context);

    return Observer(
        builder: (_) => GestureDetector(
            onTap: () {
              tabsRouter.setActiveIndex(3);
            },
            child: Container(
              margin: EdgeInsets.only(left: marginHorizontal),
              child: userStore.user?.userData.userPic != null
                  ? CircleAvatar(
                      radius: 18,
                      backgroundImage: NetworkImage(
                          userStore.user!.userData.userPic!,
                          headers: {'authorization': getBearerToken()}))
                  : const Icon(
                      Icons.account_circle_rounded,
                      size: 32.0,
                    ),
            )));
  }
}
