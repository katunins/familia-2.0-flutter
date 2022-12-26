import 'package:familia_flutter/models/note.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../screens/notesScreen/noteDetail.dart';
import '../../screens/notesScreen/noteDetailScreen.dart';
import '../notesSeparator.dart';

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
      padding: const EdgeInsets.only(bottom: 60),
      separatorBuilder: (context, index) => const Separator(),
      itemBuilder: (context, index) {
        return NoteDetail(
            note: notes[index],
            onExpand: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => NoteDetailScreen(
                      note: notes[index],
                    ))));
      },
    );
  }
}
