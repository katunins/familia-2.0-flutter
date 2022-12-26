import 'package:familia_flutter/components/bottomSheet.dart';
import 'package:familia_flutter/components/widgets/button.dart';
import 'package:familia_flutter/screens/relativesScreen/relativesListScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../components/notesSeparator.dart';
import '../../components/userDetail.dart';
import '../../components/widgets/scaffold.dart';
import '../../components/widgets/imageWidget.dart';
import '../../components/widgets/notesList.dart';
import '../../models/note.model.dart';
import '../../services/notes.service.dart';
import '../../stores/relativeItem.store.dart';
import '../../stores/relatives.store.dart';
import '../../themes/margins.theme.dart';
import '../userScreens/setUserDataScreen.dart';

class RelativeDetailScreen extends StatefulWidget {
  const RelativeDetailScreen({Key? key, required this.relative})
      : super(key: key);
  final RelativeItemStore relative;

  @override
  State<RelativeDetailScreen> createState() => _RelativeDetailScreenState();
}

class _RelativeDetailScreenState extends State<RelativeDetailScreen> {
  int totalNotes = 0;
  int page = 0;
  List<NoteModel> notes = [];

  deleteRelative() async {
    var success = await relativesStore.deleteRelative(widget.relative.data.id);
    if (success) {
      Navigator.of(context).popUntil((route) => route.isFirst);
    }
  }

  deleteRelativeSubmit() {
    AppBottomSheet.message(
        context: context,
        message: 'Подтвердите удаление родственника ${widget.relative.data.userData.name}',
      actions: [
        AppButton(
          title: 'Удалить',
          type: IAppButtonTypes.primary,
          onPressed: deleteRelative),
        AppButton(
            title: 'Отменить',
            type: IAppButtonTypes.secondary,
            onPressed: Navigator.of(context).pop)
      ]
    );
  }

  editOnPressed() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => SetUserDataScreen(
              title: 'Редактирование родственника',
              aboutLabelText: 'Расскажите о вашем родственнике',
              aboutHintText: 'Кратко опишите ключевые события из жизни человека, его профессию, особенности',
              initialData: widget.relative.data.userData,
              imageSubmit: relativesStore.updateUserPic,
              dataSaveFunction: (userData) => relativesStore.updateUserData(
                  userData: userData, relativeId: widget.relative.data.id),
              afterSubmit: Navigator.of(context).pop,
            )));
  }

  loadNotes() async {
    var result = await NotesService()
        .getRelativesNotes(page: page, relativeId: widget.relative.data.id);
    if (result?.data != null) {
      notes.addAll(result!.data);
      page = result.pagination.page;
      totalNotes = result.pagination.total;
      setState(() {});
    }
  }

  @override
  void initState() {
    loadNotes();
    super.initState();
  }

  bool onNotification(ScrollEndNotification notification) {
    if (notification.metrics.extentAfter == 0) {
      page++;
      loadNotes();
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        title: widget.relative.data.userData.name,
        hideNavigationBar: true,
        body: NotificationListener<ScrollEndNotification>(
            onNotification: onNotification,
            child: SingleChildScrollView(
              child: Observer(
                builder: (_) {
                  var userData = widget.relative.data.userData;
                  return Column(
                    children: [
                      if (userData.userPic != null)
                        getImageWidget(path: userData.userPic),
                      Container(
                        margin: EdgeInsets.all(marginHorizontal),
                        child: Column(
                          children: [
                            UserDetail(
                                name: userData.name,
                                about: userData.about,
                                parents: userData.parents,
                                editOnPressed: editOnPressed),
                            AppButton(
                                title: 'Удалить родственника',
                                type: IAppButtonTypes.link,
                                onPressed: deleteRelativeSubmit),
                          ],
                        ),
                      ),
                      if (notes.isNotEmpty) Column(
                        children: [
                          const Separator(),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 32.0),
                            child: Text(
                              'Отмечен в $totalNotes публикации(ях)',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          NotesList(notes: notes, isNested: true),
                        ],
                      ),
                      const SizedBox(height: 50),
                    ],
                  );
                },
              ),
            )));
  }
}
