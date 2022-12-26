import 'package:familia_flutter/components/widgets/button.dart';
import 'package:familia_flutter/models/note.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../components/userPicksLine.dart';
import '../../components/widgets/imageWidget.dart';
import '../../helpers/util.helper.dart';
import '../../themes/margins.theme.dart';

/// Компонент страницы публикации
/// note - публикация
/// isExpand - расширенный режим
/// onExpand - callBack при клике на элементы (подробнее ...)

class NoteDetail extends StatelessWidget {
  const NoteDetail(
      {Key? key, required this.note, this.isExpand = false, this.onExpand})
      : super(key: key);

  final NoteModel note;
  final bool isExpand;
  final Function()? onExpand;

  onSetEditMode() {}
  onPopupPressed() {}

  @override
  Widget build(BuildContext context) {
    var userPics = getUserPicksList(note.relatives);

    return Column(
      children: [
        getImageWidget(path: note.images.first),
        Container(
          margin: EdgeInsets.all(marginHorizontal),
          child: Column(
            children: [
              if (userPics.isNotEmpty)
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      UserPicsLine(userPics: userPics),
                      if (!isExpand)
                        IconButton(
                          icon: const Icon(Icons.more_vert, size: 33),
                          onPressed: onPopupPressed,
                        )
                    ],
                  ),
                ),
              GestureDetector(
                  onTap: isExpand ? null : onExpand,
                  child: Column(children: [
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        note.title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    if (note.description != '')
                      SizedBox(
                        width: double.infinity,
                        child: Text(note.description,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyText1),
                      )
                  ])),
              if (isExpand)
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: AppButton(
                      title: 'Редактировать',
                      type: IAppButtonTypes.secondary,
                      onPressed: onSetEditMode),
                ),
            ],
          ),
        ),
        if (isExpand)
          ...note.images
              .getRange(0, note.images.length - 1)
              .map((path) => getImageWidget(path: path, width: double.infinity))
              .toList()
      ],
    );
  }
}
