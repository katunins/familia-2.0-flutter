import 'package:familia_flutter/components/widgets/scaffold.dart';
import 'package:familia_flutter/components/widgets/notesList.dart';
import 'package:familia_flutter/stores/notes.store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class NotesListScreen extends StatelessWidget {
  const NotesListScreen({Key? key}) : super(key: key);

  static const routeName = '/';

  bool onNotification(ScrollEndNotification notification) {
    if (notification.metrics.extentAfter == 0) {
      notesStore.loadNextPage();
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isUserPick: true,
      isHomeButton: true,
      setSearch: notesStore.setSearch,
      body: NotificationListener<ScrollEndNotification>(
          onNotification: onNotification,
          child: Observer(
              builder: (_) => NotesList(
                  notes: notesStore.notes
                      .map((element) => element.data)
                      .toList()))),
    );
  }
}
