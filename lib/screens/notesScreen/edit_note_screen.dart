import 'package:familia_flutter/components/root/scaffold_wrapper.dart';
import 'package:familia_flutter/models/note.model.dart';
import 'package:familia_flutter/screens/notesScreen/set_note_component.dart';
import 'package:flutter/cupertino.dart';

class EditNoteScreen extends StatelessWidget {
  const EditNoteScreen({Key? key, required this.note}) : super(key: key);

  static const pathName = 'editNote';
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
        title: 'Редактирование записи', body: SetNote(initialData: note));
  }
}
