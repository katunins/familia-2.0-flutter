import 'package:familia_flutter/components/widgets/button.dart';
import 'package:familia_flutter/components/widgets/imageWidget.dart';
import 'package:familia_flutter/config.dart';
import 'package:familia_flutter/screens/userScreens/setUserDataScreen.dart';
import 'package:familia_flutter/stores/app.store.dart';
import 'package:familia_flutter/stores/user.store.dart';
import 'package:familia_flutter/themes/margins.theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../components/widgets/getScaffold.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {

    editOnPressed() {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => SetUserDataScreen(
                title: 'Редактирование профиля',
                initialData: userStore.user?.userData,
                imageSubmit: userStore.updateUserPic,
                dataSaveFunction: userStore.updateUserData,
                afterSubmit: Navigator.of(context).pop,
              )));
    }

    return AppScaffold(
        hideNavigationBar: true,
        title: 'Профиль',
        isHomeButton: true,
        body: Observer(
            builder: (_) => SingleChildScrollView(
                  child: Column(
                    children: [
                      if (userStore.user?.userData?.userPic != null)
                        getImageWidget(
                            path: userStore.user!.userData!.userPic!),
                      Container(
                        margin: EdgeInsets.all(marginHorizontal),
                        child: Column(
                          children: [
                            Text(
                              userStore.user?.userData?.name ??
                                  Config.defaultUserName,
                              style: Theme.of(context).textTheme.headlineMedium,
                              textAlign: TextAlign.center,
                            ),
                            if (userStore.user?.userData?.about != null)
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 32.0),
                                child: Text(userStore.user!.userData!.about!,
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                              ),
                            AppButton(
                                title: 'Редактировать',
                                type: IAppButtonTypes.primary,
                                onPressed: editOnPressed),
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
                )));
  }
}
