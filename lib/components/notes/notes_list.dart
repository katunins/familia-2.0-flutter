import 'package:auto_route/auto_route.dart';
import 'package:familia_flutter/models/note.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../helpers/bottom_sheet.dart';
import '../../routers/app_router.gr.dart';
import '../../stores/notes.store.dart';
import '../common/button.dart';
import '../widgets/notes_separator.dart';
import 'note_list_item.dart';

/// Комопнент списка публикаций
/// notes - публикации
/// isNested - для случаев, где компонент должен быть не "листабельным"
/// readOnly - дизейблит кнопку меню

class NotesList extends StatelessWidget {
  const NotesList(
      {Key? key,
      required this.idList,
      this.isNested = false,
      this.readOnly = false})
      : super(key: key);
  final List<String> idList;
  final bool isNested;
  final bool readOnly;

  @override
  Widget build(BuildContext context) => Observer(builder: (_) {
        List<NoteModel> notes =
            idList.map((id) => notesStore.getById(id)).toList();

        return ListView.separated(
          primary: !isNested,
          shrinkWrap: isNested,
          itemCount: notes.length,
          padding: const EdgeInsets.only(bottom: 50),
          separatorBuilder: (context, index) => const Separator(),
          itemBuilder: (context, index) => NoteListItem(
            note: notes[index],
            onTap: () =>
                context.pushRoute(NoteDetailRouter(id: notes[index].id)),
            onMenuPressed: readOnly ? null : () =>
                BottomSheetHelper.message(context: context, actions: [
              AppButton(
                  title: 'Редактировать',
                  onPressed: () => context.router
                      .popAndPush(EditNoteRouter(note: notes[index])),
                  type: IAppButtonTypes.primary),
              AppButton(
                  title: 'Удалить',
                  type: IAppButtonTypes.secondary,
                  onPressed: () async {
                    var result = await notesStore.delete(notes[index]);
                    if (result) {
                      context.router.popUntilRoot();
                      // context.router
                      //     .popUntilRouteWithPath(NotesListScreen.pathName);
                    }
                  }),
            ]),
          ),
        );
      });
}
