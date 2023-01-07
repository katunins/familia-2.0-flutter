import 'package:familia_flutter/components/root/scaffold_wrapper.dart';
import 'package:familia_flutter/models/note.model.dart';
import 'package:familia_flutter/screens/notesScreen/set_note_component.dart';
import 'package:flutter/cupertino.dart';

class CreateNoteScreen extends StatelessWidget {
  const CreateNoteScreen({Key? key}) : super(key: key);

  static const pathName = 'createNote';

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      title: 'Новая запись',
        body: SetNote(
          initialData: NoteModel.createEmpty(),
        )
    );
  }
}