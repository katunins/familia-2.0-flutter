import 'package:auto_route/auto_route.dart';
import 'package:familia_flutter/components/root/scaffold_wrapper.dart';
import 'package:familia_flutter/components/common/set_user_data_component.dart';
import 'package:familia_flutter/stores/relatives.store.dart';
import 'package:flutter/cupertino.dart';

import '../../models/base_user_data.model.dart';

/// finishCallback - функция, вызывающаяся после сохранения нового пользователя
/// hideBottomSheetAddRelativeButton - при выборе родителя скрывать кнопку Добавить пользователя

@RoutePage(name: 'CreateNewRelativeRouter')
class CreateRelativeScreen extends StatelessWidget {
  const CreateRelativeScreen(
      {Key? key,
      this.finishCallback,
      this.hideBottomSheetAddRelativeButton = false})
      : super(key: key);

  static const String pathName = 'createRelative';

  final Function(String?)? finishCallback;
  final bool hideBottomSheetAddRelativeButton;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
        title: 'Новый родственник',
        body: SetUserDataComponent(
          initialData: BaseUserDataModel.createEmpty(),
          aboutHintText: 'Расскажите о вашем родственнике',
          aboutLabelText:
              'Кратко опишите ключевые события из жизни человека, его профессию, особенности',
          imageSubmit: relativesStore.updateUserPic,
          dataSaveFunction: relativesStore.newUser,
          hideBottomSheetAddRelativeButton: hideBottomSheetAddRelativeButton,
          afterSubmit: ({String? resultId}) {
            if (finishCallback != null) {
              finishCallback!(resultId);
            }
            context.router.pop();
          },
        ));
  }
}
