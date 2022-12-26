import 'package:familia_flutter/models/baseUserData.model.dart';
import 'package:familia_flutter/models/parents.model.dart';
import 'package:familia_flutter/navigation/tabRoutes.dart';
import 'package:familia_flutter/stores/navigation.store.dart';
import 'package:flutter/material.dart';
import '../../models/gender.enum.dart';
import '../../screens/userScreens/setUserDataScreen.dart';
import '../../stores/relatives.store.dart';
import '../../themes/colors.dart';

getFloatingButton() {
  Function()? onPressed;
  final context = navigationStore.currentKey.currentContext;

  switch (navigationStore.currentAppRoute) {
    case TabRoutes.relatives:
      onPressed = () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => SetUserDataScreen(
                  title: 'Новый родственник',
                  initialData: BaseUserDataModel(
                    name: '',
                    about: '',
                    gender: Gender.none,
                    parents: ParentsModel.createEmpty(),
                  ),
                  aboutHintText: 'Расскажите о вашем родственнике',
                  aboutLabelText:
                      'Кратко опишите ключевые события из жизни человека, его профессию, особенности',
                  imageSubmit: relativesStore.updateUserPic,
                  dataSaveFunction: relativesStore.newUser,
                  afterSubmit: Navigator.of(context).pop,
                )));
      };
      break;
    default:
      onPressed = () {};
  }

  return FloatingActionButton(
    backgroundColor: AppColors.primaryColor,
    onPressed: onPressed,
    child: const Icon(Icons.add, size: 30),
  );
}
