import 'package:familia_flutter/components/root/scaffold_wrapper.dart';
import 'package:familia_flutter/models/note.model.dart';
import 'package:familia_flutter/screens/notesScreen/note_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoteDetailScreen extends StatelessWidget {
  const NoteDetailScreen({Key? key, required this.note}) : super(key: key);

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
        title: note.title,
        isUserPic: true,
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 60),
          child: NoteDetail(note: note, isExpand: true),
        ));
  }
}
