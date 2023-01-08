import 'package:auto_route/auto_route.dart';
import 'package:familia_flutter/components/common/user_detail.dart';
import 'package:familia_flutter/components/common/button.dart';
import 'package:familia_flutter/components/common/image_widget.dart';
import 'package:familia_flutter/screens/profileScreen/edit_profile_screen.dart';
import 'package:familia_flutter/stores/app.store.dart';
import 'package:familia_flutter/stores/user.store.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../components/root/scaffold_wrapper.dart';
import '../../themes/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static const pathName = 'profileScreen';

  @override
  Widget build(BuildContext context) {
    editOnPressed() {
      context.router.pushNamed(EditProfileScreen.pathName);
    }

    return ScaffoldWrapper(
      title: 'Профиль пользователя',
        body: Observer(builder: (_) {
      var userData = userStore.user!.userData;

      return SingleChildScrollView(
        child: Column(
          children: [
            if (userData?.userPic != null)
              getImageWidget(path: userData!.userPic),
            Container(
              margin: EdgeInsets.all(AppSizes.marginHorizontal),
              child: Column(
                children: [
                  UserDetail(
                      name: userData.name,
                      about: userData.about,
                      parents: userData.parents,
                      editOnPressed: editOnPressed),
                  AppButton(
                      title: 'Выйти из аккаунта',
                      type: IAppButtonTypes.link,
                      onPressed: appStore.logOut),
                  const SizedBox(height: 50),
                ],
              ),
            )
          ],
        ),
      );
    })
    );
  }
}
