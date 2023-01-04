import 'package:auto_route/auto_route.dart';
import 'package:familia_flutter/models/note.model.dart';
import 'package:familia_flutter/routers/app_router.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../screens/notesScreen/note_detail.dart';
import '../widgets/notes_separator.dart';

/// Комопнент списка публикаций
/// notes - публикации
/// isNested - для случаев, где компонент должен быть не "листабельным"

class NotesList extends StatelessWidget {
  const NotesList({Key? key, required this.notes, this.isNested = false})
      : super(key: key);
  final List<NoteModel> notes;
  final bool isNested;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      primary: !isNested,
      shrinkWrap: isNested,
      itemCount: notes.length,
      padding: const EdgeInsets.only(bottom: 50),
      separatorBuilder: (context, index) => const Separator(),
      itemBuilder: (context, index) {
        return NoteDetail(
          note: notes[index],
          onExpand: () =>
              context.pushRoute(NoteDetailRouter(note: notes[index])),
        );
      },
    );
  }
}
