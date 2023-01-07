import 'package:flutter/cupertino.dart';

import '../../components/notes/notes_list.dart';
import '../../components/root/scaffold_wrapper.dart';
import '../../models/note.model.dart';
import '../../models/search_store_bar.model.dart';
import '../../services/notes.service.dart';

class RelativeNotesListScreen extends StatefulWidget {
  const RelativeNotesListScreen({Key? key, required this.relativeId})
      : super(key: key);

  static const String pathName = 'relativeNotesList';

  final String relativeId;

  @override
  State<RelativeNotesListScreen> createState() =>
      _RelativeNotesListScreenState();
}

class _RelativeNotesListScreenState extends State<RelativeNotesListScreen> {
  int totalNotes = 0;
  int page = 0;
  List<NoteModel> notes = [];
  String search = '';

  setSearch(String val) {
    search = val;
    page = 0;
    notes = [];
    // setState(() {});
    loadNotes();
  }

  loadNotes() async {
    var result = await NotesService().getRelativeNotes(
        page: page, relativeId: widget.relativeId, search: search);
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
    return ScaffoldWrapper(
        searchBarStore:
            SearchBarStoreModel(search: search, setSearch: setSearch),
        body: NotificationListener<ScrollEndNotification>(
            onNotification: onNotification,
            child: NotesList(
                readOnly: true,
                idList: notes.map((element) => element.id).toList())));
  }
}
