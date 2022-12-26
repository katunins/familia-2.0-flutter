import 'package:familia_flutter/components/userDetail.dart';
import 'package:familia_flutter/components/widgets/button.dart';
import 'package:familia_flutter/components/widgets/imageWidget.dart';
import 'package:familia_flutter/screens/userScreens/setUserDataScreen.dart';
import 'package:familia_flutter/stores/app.store.dart';
import 'package:familia_flutter/stores/user.store.dart';
import 'package:familia_flutter/themes/margins.theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../components/parents.dart';
import '../../components/widgets/scaffold.dart';
import '../../helpers/util.helper.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {

    editOnPressed() {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => SetUserDataScreen(
                title: 'Редактирование профиля',
                initialData: userStore.user!.userData,
                aboutLabelText: 'Расскажите о себе',
                aboutHintText: 'Укажите когда и где вы родились, а также опишите какие то важные события вашей жизни',
                imageSubmit: userStore.updateUserPic,
                dataSaveFunction: userStore.updateUserData,
                afterSubmit: Navigator.of(context).pop,
              )));
    }

    return AppScaffold(
        hideNavigationBar: true,
        title: 'Профиль',
        isHomeButton: true,
        body: Observer(builder: (_) {
          var userData = userStore.user?.userData;

          return SingleChildScrollView(
            child: Column(
              children: [
                if (userData?.userPic != null)
                  getImageWidget(path: userData!.userPic!),
                Container(
                  margin: EdgeInsets.all(marginHorizontal),
                  child: Column(
                    children: [
                      UserDetail(
                          name: userData?.name ?? '',
                          about: userData?.about,
                          parents: userData?.parents,
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
        }));
  }
}
