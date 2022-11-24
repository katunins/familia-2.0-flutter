import 'package:familia_flutter/stores/navigation.store.dart';
import 'package:familia_flutter/themes/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../components/widgets/getScaffold.dart';
import '../../components/widgets/imageWidget.dart';
import '../../components/widgets/linkButton.dart';
import '../../config.dart';
import '../../helpers/get.helper.dart';
import '../../stores/relativeItem.store.dart';
import '../../stores/relatives.store.dart';
import '../../themes/margins.theme.dart';
import '../userScreens/setUserDataScreen.dart';

class RelativeDetailScreen extends StatelessWidget {
  const RelativeDetailScreen({Key? key, required this.relative})
      : super(key: key);
  final RelativeItemStore relative;

  @override
  Widget build(BuildContext context) {

    deleteRelative() async {
      var success = await relativesStore.deleteRelative(relative.data.id);
      if (success) {
        Navigator.of(context).pop();
      }
    }

    deleteRelativeSubmit() {
      showPopup(
        title: 'Удаление',
        middleText:
            'Подтвердите удаление родственника ${relative.data.userData.name} из системы?',
        textConfirm: 'Удалить',
        onCancel: (){},
        onConfirm: deleteRelative,
      );
    }

    return AppScaffold(
        title: relative.data.userData.name,
        body: SingleChildScrollView(
          child: Observer(
            builder: (_) => Column(
              children: [
                if (relative.data.userData?.userPic != null)
                  getImageWidget(path: relative.data.userData!.userPic!),
                Container(
                  margin: EdgeInsets.all(marginHorizontal.horizontal),
                  child: Column(
                    children: [
                      Text(
                        relative.data.userData.name ??
                            Config.defaultRelativeName,
                        style: Theme.of(context).textTheme.headlineMedium,
                        textAlign: TextAlign.center,
                      ),
                      if (relative.data.userData?.about != '')
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 32.0),
                          child: Text(relative.data.userData!.about!,
                              style: Theme.of(context).textTheme.bodyText1),
                        )
                      else
                        SizedBox(
                          height: AppSizes.inputVerticalMargin,
                        ),
                      const Divider(
                        thickness: 2.0,
                      ),
                      getLinkButton(
                          text: 'Редактировать',
                          onPressed: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => SetUserDataScreen(
                                        title: 'Редактирование родственника',
                                        isRelativeMode: true,
                                        initialData: relative.data.userData,
                                        imageSubmit: relativesStore.updateUserPic,
                                        dataSaveFunction: (userData) =>
                                            relativesStore.updateUserData(
                                                userData: userData,
                                                relativeId: relative.data.id),
                                        afterSubmit: Navigator.of(context).pop,
                                      )))),
                      getLinkButton(
                          text: 'Удалить родственника',
                          isGrey: true,
                          onPressed: deleteRelativeSubmit),
                      const SizedBox(height: 50),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
