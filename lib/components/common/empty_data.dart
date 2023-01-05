import 'package:auto_route/auto_route.dart';
import 'package:familia_flutter/components/common/icon_label_row.dart';
import 'package:familia_flutter/components/icons/notes.dart';
import 'package:familia_flutter/components/icons/tree.dart';
import 'package:familia_flutter/routers/app_router.gr.dart';
import 'package:familia_flutter/stores/notes.store.dart';
import 'package:familia_flutter/stores/relatives.store.dart';
import 'package:familia_flutter/stores/user.store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../icons/relatives.dart';
import '../widgets/profile_user_pic.dart';

class EmptyData extends StatelessWidget {
  const EmptyData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconLabelRow(
                    label: 'Заполните данные в своем профиле',
                    icon: const ProfileUserPic(),
                    isChecked: userStore.isRequiredFilled,
                    onTap: userStore.isRequiredFilled
                        ? null
                        : () {
                            context.router.navigate(const ProfileRouter(
                                children: [EditProfileRouter()]));
                          }
                    // context.router.pushNamed(EditProfileScreen.pathName),
                    ),
                IconLabelRow(
                    label: 'Добавьте ближайших родственников',
                    icon: const RelativesIcon(),
                    isChecked: relativesStore.relatives.isNotEmpty,
                    onTap: relativesStore.relatives.isNotEmpty
                        ? null
                        : () {
                            context.router.navigate(RelativesRouter(children: [
                              CreateNewRelativeRouter()
                            ]));
                          }),
                IconLabelRow(
                  label: 'Отметьте родителей у себя и у других родственников',
                  icon: const TreeIcon(),
                  isChecked: userStore.isParentsNotEmpty,
                ),
                IconLabelRow(
                  label:
                      'Добавьте фотогарфии, отметьте на них родственников и опишите событие',
                  icon: const NotesIcon(),
                  isChecked: notesStore.pagination.totalAll > 0,
                ),
              ],
            ));
  }
}
