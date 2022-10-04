import 'package:familia_flutter/components/widgets/linkButton.dart';
import 'package:familia_flutter/components/widgets/networkImage.dart';
import 'package:familia_flutter/config.dart';
import 'package:familia_flutter/models/baseUserData.model.dart';
import 'package:familia_flutter/screens/userScreens/setUserDataScreen.dart';
import 'package:familia_flutter/stores/app.store.dart';
import 'package:familia_flutter/stores/navigation.store.dart';
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
    return getScaffold(
        hideNavigationBar: true,
        hideUserPick: true,
        title: 'Профиль',
        isAlwaysBack: true,
        body: Observer(builder: (_)=>SingleChildScrollView(
          child: Column(
            children: [
              if (userStore.user?.userData?.userPic != null) Image(image: getNetworkImage(userStore.user!.userData!.userPic!)),
              Container(
                margin: EdgeInsets.all(marginHorizontal.horizontal),
                child: Column(
                  children: [
                    Text(
                      userStore.user?.userData?.name ?? Config.defaultUserName,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    if (userStore.user?.userData?.about != null)
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 32.0),
                        child: Text(userStore.user!.userData!.about!,
                            style: Theme.of(context).textTheme.bodyText1),
                      ),
                    getLinkButton(
                        text: 'Редактировать',
                        onPressed: () => Navigator.of(context)
                                    .push(MaterialPageRoute(
                                        builder: (_) => SetUserDataScreen(
                                              title: 'Редактирование профиля',
                                              initialData: BaseUserDataModel(
                                                  name: userStore
                                                      .user?.userData?.name,
                                                  about: userStore
                                                      .user?.userData?.about),
                                              imageSubmit:
                                                  userStore.updateUserPic,
                                              dataSubmit:
                                                  userStore.updateUserData,
                                              afterSubmit:
                                                  Navigator.of(context).pop,
                                            )))),
                    const SizedBox(height: 12),
                    getLinkButton(text: 'Выйти из аккаунта', isGrey: true, onPressed: appStore.logOut),
                    const SizedBox(height: 50),
                  ],
                ),
              )
            ],
          ),
        )));
  }
}
