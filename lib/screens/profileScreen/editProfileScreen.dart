import 'package:auto_route/auto_route.dart';
import 'package:familia_flutter/components/widgets/scaffoldWrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../stores/user.store.dart';
import '../userScreens/setUserDataScreen.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  static const pathName = 'editProfile';

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => ScaffoldWrapper(
            title: 'Редактирование',
            body: SetUserDataScreen(
              initialData: userStore.user!.userData,
              aboutLabelText: 'Расскажите о себе',
              aboutHintText:
                  'Укажите когда и где вы родились, а также опишите какие то важные события вашей жизни',
              imageSubmit: userStore.updateUserPic,
              dataSaveFunction: userStore.updateUserData,
              afterSubmit: context.router.pop,
            )));
  }
}
