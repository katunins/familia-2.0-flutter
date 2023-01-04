import 'package:familia_flutter/components/bottomSheet.dart';
import 'package:familia_flutter/components/parents.dart';
import 'package:familia_flutter/components/relativesListSheet.dart';
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
  const UpdateParents(
      {Key? key, required this.parents, required this.onSelected, this.childId})
      : super(key: key);

  final ParentsModel? parents;
  final String? childId;
  final Function({required String oldParentId, required String newParentId})
      onSelected;

  @override
  Widget build(BuildContext context) {

    onPressed(String oldParentId) {

      List<String> excluded = childId == null ? [] : [childId!];
      if (parents != null){
        excluded.addAll(parents!.toIdsList());
      }

      AppBottomSheet.show(
          context: context,
          isScrollControlled: true,
          widget: RelativesListSheet(
              excluded: excluded,
              onSelected: (String newParentId) => onSelected(
                  oldParentId: oldParentId, newParentId: newParentId)));
    }

    return Parents(
        parents: parents,
        emptyTitle: 'Нажмите для добавления',
        onPressed: onPressed);
  }
}
