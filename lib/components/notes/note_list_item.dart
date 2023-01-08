import 'package:familia_flutter/components/common/label_count.dart';
import 'package:flutter/material.dart';

import '../../helpers/util.helper.dart';
import '../../models/note.model.dart';
import '../../themes/sizes.dart';
import '../common/image_widget.dart';
import '../common/marked_relatives.dart';

class NoteListItem extends StatelessWidget {
  const NoteListItem(
      {Key? key,
      required this.note,
      this.hideCountLabel = false,
      required this.onTap,
      required this.onMenuPressed})
      : super(key: key);

  final NoteModel note;
  final bool hideCountLabel;
  final Function()? onTap;
  final Function()? onMenuPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
            onTap: onTap,
            child: Stack(
              children: [
                getImageWidget(path: note.images.first),
                if (!hideCountLabel && note.images.length > 1)
                  Positioned(
                      right: AppSizes.marginHorizontal,
                      bottom: 20,
                      child: LabelCount(count: note.images.length - 1))
              ],
            )),
        Container(
            margin: EdgeInsets.all(AppSizes.marginHorizontal),
            child: Column(children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: MarkedRelatives(
                    userPics: getUserPicsList(note.relatives),
                    iconButton: IconButton(
                      icon: const Icon(Icons.more_vert, size: 33),
                      onPressed: onMenuPressed,
                    )),
              ),
              GestureDetector(
                  onTap: onTap,
                  child: Column(children: [
                    if (note.title != '')
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
                  ]))
            ]))
      ],
    );
  }
}
