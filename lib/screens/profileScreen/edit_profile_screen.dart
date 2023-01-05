import 'package:auto_route/auto_route.dart';
import 'package:familia_flutter/components/root/scaffold_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../stores/user.store.dart';
import '../userScreens/set_user_data_component.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  static const pathName = 'editProfile';

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => ScaffoldWrapper(
            title: 'Редактирование профиля',
            body: SetUserDataComponent(
              id: userStore.user!.id,
              hideBottomSheetAddRelativeButton: false,
              initialData: userStore.user!.userData,
              aboutLabelText: 'Расскажите о себе',
              aboutHintText:
                  'Укажите когда и где вы родились, а также опишите какие то важные события вашей жизни',
              imageSubmit: userStore.updateUserPic,
              dataSaveFunction: userStore.updateUserData,
              afterSubmit: ({String? resultId}){
                context.router.pop();
              },
            )));
  }
}
