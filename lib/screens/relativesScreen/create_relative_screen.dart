import 'package:auto_route/auto_route.dart';
import 'package:familia_flutter/components/root/scaffold_wrapper.dart';
import 'package:familia_flutter/screens/userScreens/set_user_data_component.dart';
import 'package:familia_flutter/stores/relatives.store.dart';
import 'package:flutter/cupertino.dart';

import '../../models/base_user_data.model.dart';
import '../../models/gender.enum.dart';
import '../../models/parents.model.dart';

class CreateRelativeScreen extends StatelessWidget {
  CreateRelativeScreen({Key? key}) : super(key: key);

  static const String pathName = 'createRelative';

  final initialData = BaseUserDataModel(
    name: '',
    about: '',
    gender: Gender.none,
    parents: ParentsModel.createEmpty(),
  );

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      title: 'Новый родственник',
        body: SetUserDataComponent(
      initialData: initialData,
      aboutHintText: 'Расскажите о вашем родственнике',
      aboutLabelText: 'Кратко опишите ключевые события из жизни человека, его профессию, особенности',
      imageSubmit: relativesStore.updateUserPic,
      dataSaveFunction: relativesStore.newUser,
      afterSubmit: context.router.pop,
    ));
  }
}
