import 'package:auto_route/auto_route.dart';
import 'package:familia_flutter/components/root/scaffold_wrapper.dart';
import 'package:familia_flutter/models/relative.model.dart';
import 'package:flutter/cupertino.dart';

import '../../stores/relatives.store.dart';
import '../userScreens/set_user_data_component.dart';

class EditRelativeScreen extends StatelessWidget {
  const EditRelativeScreen({Key? key, required this.relative})
      : super(key: key);

  static const String pathName = 'editRelative';

  final RelativeModel relative;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
        title: 'Редактирование',
        body: SetUserDataComponent(
          id: relative.id,
          hideBottomSheetAddRelativeButton: false,
          aboutLabelText: 'Расскажите о вашем родственнике',
          aboutHintText:
              'Кратко опишите ключевые события из жизни человека, его профессию, особенности',
          initialData: relative.userData,
          imageSubmit: relativesStore.updateUserPic,
          dataSaveFunction: (userData) => relativesStore.updateUserData(
              userData: userData, relativeId: relative.id),
          afterSubmit: ({String? resultId}) {
            context.router.pop();
          },
        ));
  }
}
