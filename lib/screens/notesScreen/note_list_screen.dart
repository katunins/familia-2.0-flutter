import 'package:familia_flutter/components/common/empty_data.dart';
import 'package:familia_flutter/components/notes/notes_list.dart';
import 'package:familia_flutter/components/root/scaffold_wrapper.dart';
import 'package:familia_flutter/models/search_store_bar.model.dart';
import 'package:familia_flutter/stores/notes.store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class NotesListScreen extends StatelessWidget {
  const NotesListScreen({Key? key}) : super(key: key);

  bool onNotification(ScrollEndNotification notification) {
    if (notification.metrics.extentAfter == 0) {
      notesStore.loadNextPage();
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
        searchBarStore: SearchBarStoreModel(
            search: notesStore.search, setSearch: notesStore.setSearch),
        body: NotificationListener<ScrollEndNotification>(
            onNotification: onNotification,
            child: Observer(
                builder: (_) => notesStore.pagination.totalAll == 0
                    ? const Center(
                        child: EmptyData(),
                      )
                    : NotesList(
                        notes: notesStore.notes
                            .map((element) => element.data)
                            .toList()))));
  }
}
