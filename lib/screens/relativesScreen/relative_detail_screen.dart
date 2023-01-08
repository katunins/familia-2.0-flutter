import 'package:auto_route/auto_route.dart';
import 'package:familia_flutter/helpers/bottom_sheet.dart';
import 'package:familia_flutter/components/common/button.dart';
import 'package:familia_flutter/components/root/scaffold_wrapper.dart';
import 'package:familia_flutter/models/relative.model.dart';
import 'package:familia_flutter/routers/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../components/common/user_detail.dart';
import '../../components/common/image_widget.dart';
import '../../services/notes.service.dart';
import '../../stores/relatives.store.dart';
import '../../themes/sizes.dart';

class RelativeDetailScreen extends StatefulWidget {
  const RelativeDetailScreen({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  State<RelativeDetailScreen> createState() => _RelativeDetailScreenState();
}

class _RelativeDetailScreenState extends State<RelativeDetailScreen> {
  int totalNotes = 0;

  deleteRelative() async {
    var success = await relativesStore.deleteRelative(widget.id);
    if (success) {
      context.router.popUntilRoot();
    }
  }

  loadNotesCount() async {
    var result = await NotesService().getRelativeNotesCount(widget.id);
    if (result != null) {
      totalNotes = result;
      setState(() {});
    }
  }

  @override
  void initState() {
    loadNotesCount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Observer(builder: (_) {
        RelativeModel relative = relativesStore.getRelativeById(widget.id);
        var userData = relative.userData;

        deleteRelativeSubmit() {
          BottomSheetHelper.message(
              context: context,
              message: 'Подтвердите удаление родственника ${relative.userData.name}',
              actions: [
                AppButton(title: 'Удалить', type: IAppButtonTypes.primary, onPressed: deleteRelative),
                AppButton(title: 'Отменить', type: IAppButtonTypes.secondary, onPressed: context.router.pop)
              ]);
        }

        editOnPressed() {
          context.pushRoute(EditRelativeRouter(relative: relative));
        }

        return ScaffoldWrapper(
            title: userData.name,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  if (userData.userPic != null) getImageWidget(path: userData.userPic),
                  Container(
                    margin: EdgeInsets.all(AppSizes.marginHorizontal),
                    child: Column(
                      children: [
                        UserDetail(
                            name: userData.name,
                            about: userData.about,
                            parents: userData.parents,
                            editOnPressed: editOnPressed),
                        if (totalNotes > 0)
                          AppButton(
                              title: 'Отмечен в $totalNotes публикации(ях)',
                              onPressed: () =>
                                  context.pushRoute(RelativeNotesRouter(relativeId: widget.id)),
                              type: IAppButtonTypes.secondary),
                        AppButton(
                            title: 'Удалить родственника',
                            type: IAppButtonTypes.link,
                            onPressed: deleteRelativeSubmit),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ));
      });
}
