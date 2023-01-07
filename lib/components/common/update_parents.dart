import 'package:familia_flutter/helpers/bottom_sheet.dart';
import 'package:familia_flutter/components/tree/parents.dart';
import 'package:familia_flutter/components/relatives/relatives_list_sheet.dart';
import 'package:familia_flutter/models/parents.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Компонент редактирования родителей
/// parents - объект родителей
/// onSelected (oldParentId, newParentId) - callBack выбора пользователя
/// oldParentId - id пользователя (родителя), который был изменен. Может быть "" - значит пользователя не было
/// newParentId - выбранный id
/// childId - id пользователя у которого редактируются родители

class UpdateParents extends StatelessWidget {
  const UpdateParents({
    Key? key,
    required this.parents,
    required this.onSelected,
    this.childId,
    required this.hideBottomSheetAddRelativeButton,
  }) : super(key: key);

  final ParentsModel? parents;
  final String? childId;
  final bool hideBottomSheetAddRelativeButton;
  final Function({required String oldParentId, required String newParentId})
      onSelected;

  onPressed(BuildContext context, String oldParentId) {
    List<String> excluded = childId == null ? [] : [childId!];
    if (parents != null) {
      excluded.addAll(parents!.toIdsList());
    }
    BottomSheetHelper.show(
        context: context,
        isScrollControlled: true,
        widget: RelativesListSheet(
          excluded: excluded,
          hideAddRelativeButton: hideBottomSheetAddRelativeButton,
          onSelected: (newParentId) =>
              onSelected(oldParentId: oldParentId, newParentId: newParentId),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Parents(
        parents: parents,
        emptyTitle: 'Нажмите для добавления',
        onPressed: (String oldParentId) => onPressed(context, oldParentId));
  }
}
