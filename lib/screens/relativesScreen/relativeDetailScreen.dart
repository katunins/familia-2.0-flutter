import 'package:familia_flutter/components/parents.dart';
import 'package:familia_flutter/components/relativesLineBlock.dart';
import 'package:familia_flutter/components/widgets/button.dart';
import 'package:familia_flutter/helpers/util.helper.dart';
import 'package:familia_flutter/models/relative.model.dart';
import 'package:familia_flutter/stores/user.store.dart';
import 'package:familia_flutter/themes/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../components/widgets/getScaffold.dart';
import '../../components/widgets/imageWidget.dart';
import '../../config.dart';
import '../../helpers/get.helper.dart';
import '../../stores/relativeItem.store.dart';
import '../../stores/relatives.store.dart';
import '../../themes/colors.dart';
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
        onCancel: () {},
        onConfirm: deleteRelative,
      );
    }

    editOnPressed() {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => SetUserDataScreen(
                title: 'Редактирование родственника',
                isRelativeMode: true,
                initialData: relative.data.userData,
                imageSubmit: relativesStore.updateUserPic,
                dataSaveFunction: (userData) => relativesStore.updateUserData(
                    userData: userData, relativeId: relative.data.id),
                afterSubmit: Navigator.of(context).pop,
              )));
    }

    return AppScaffold(
        title: relative.data.userData.name,
        hideNavigationBar: true,
        body: SingleChildScrollView(
          child: Observer(
            builder: (_) => Column(
              children: [
                if (relative.data.userData?.userPic != null)
                  getImageWidget(path: relative.data.userData!.userPic!),
                Container(
                  margin: EdgeInsets.all(marginHorizontal),
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
                      if (relative.data.userData?.parents != null &&
                          relative.data.userData!.parents!.toList().isNotEmpty)
                        Parents(
                            elements: getTreeElements(
                                relative.data.userData.parents!.toList())),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        child: const Divider(
                          thickness: 2.0,
                        ),
                      ),
                      AppButton(
                          title: 'Редактировать',
                          type: IAppButtonTypes.secondary,
                          onPressed: editOnPressed),
                      AppButton(
                          title: 'Удалить родственника',
                          type: IAppButtonTypes.link,
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
