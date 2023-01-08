import 'package:auto_route/auto_route.dart';
import 'package:familia_flutter/components/common/empty_data.dart';
import 'package:familia_flutter/components/root/scaffold_wrapper.dart';
import 'package:familia_flutter/models/search_store_bar.model.dart';
import 'package:familia_flutter/routers/app_router.gr.dart';
import 'package:familia_flutter/stores/notes.store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../components/common/button.dart';
import '../../components/notes/note_list_item.dart';
import '../../components/widgets/notes_separator.dart';
import '../../helpers/bottom_sheet.dart';

class NotesListScreen extends StatelessWidget {
  const NotesListScreen({Key? key}) : super(key: key);

  static const String pathName = 'notesList';

  bool onNotification(ScrollEndNotification notification) {
    if (notification.metrics.extentAfter == 0) {
      notesStore.loadNextPage();
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
        floatingOnPressed: () => context.pushRoute(const CreateNoteRouter()),
        searchBarStore: SearchBarStoreModel(search: notesStore.search, setSearch: notesStore.setSearch),
        body: NotificationListener<ScrollEndNotification>(
            onNotification: onNotification,
            child: Observer(
                builder: (_) => notesStore.pagination.totalAll == 0
                    ? const Center(
                        child: EmptyData(),
                      )
                    : ListView.separated(
                        itemCount: notesStore.notes.length,
                        padding: const EdgeInsets.only(bottom: 50),
                        separatorBuilder: (context, index) => const Separator(),
                        itemBuilder: (context, index) => NoteListItem(
                          note: notesStore.notes[index],
                          onTap: () => context.pushRoute(NoteDetailRouter(id: notesStore.notes[index].id)),
                          onMenuPressed: () => BottomSheetHelper.message(context: context, actions: [
                            AppButton(
                                title: 'Редактировать',
                                onPressed: () =>
                                    context.router.popAndPush(EditNoteRouter(note: notesStore.notes[index])),
                                type: IAppButtonTypes.primary),
                            AppButton(
                                title: 'Удалить',
                                type: IAppButtonTypes.secondary,
                                onPressed: () async {
                                  var result = await notesStore.delete(notesStore.notes[index]);
                                  if (result) {
                                    context.router.popUntilRoot();
                                    // context.router
                                    //     .popUntilRouteWithPath(NotesListScreen.pathName);
                                  }
                                }),
                          ]),
                        ),
                      ))));
  }
}
