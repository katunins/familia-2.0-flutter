import 'package:auto_route/auto_route.dart';
import 'package:familia_flutter/components/notes/note_list_item.dart';
import 'package:familia_flutter/components/root/scaffold_wrapper.dart';
import 'package:familia_flutter/models/note.model.dart';
import 'package:familia_flutter/stores/notes.store.dart';
import 'package:familia_flutter/themes/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../components/common/button.dart';
import '../../components/common/image_widget.dart';
import '../../routers/app_router.gr.dart';

@RoutePage(name: 'NoteDetailRouter')
class NoteDetailScreen extends StatelessWidget {
  const NoteDetailScreen({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) => Observer(builder: (_) {
        NoteModel note = notesStore.getById(id);
        List<String> extraImages = note.images.sublist(1);

        return ScaffoldWrapper(
            title: note.title,
            isUserPic: true,
            body: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 60),
              child: Column(
                children: [
                  NoteListItem(
                    note: note,
                    hideCountLabel: true,
                    onTap: null,
                    onMenuPressed: null,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: 20, horizontal: AppSizes.marginHorizontal),
                    child: AppButton(
                        title: 'Редактировать',
                        type: IAppButtonTypes.secondary,
                        onPressed: () =>
                            context.pushRoute(EditNoteRouter(note: note))),
                  ),
                  ListView.separated(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: extraImages.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    itemBuilder: (context, index) =>
                        getImageWidget(path: extraImages[index]),
                  )
                ],
              ),
            ));
      });
}
