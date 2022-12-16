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

class UpdateParents extends StatelessWidget {
  const UpdateParents(
      {Key? key, required this.parents, required this.onSelected})
      : super(key: key);

  final ParentsModel? parents;
  final Function({required String oldParentId, required String newParentId})
      onSelected;

  @override
  Widget build(BuildContext context) {
    onPressed(String oldParentId) {
      showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16)),
          ),
          builder: (_) => RelativesListSheet(
              excluded: parents?.toIdsList(),
              onSelected: (String newParentId) => onSelected(
                  oldParentId: oldParentId, newParentId: newParentId)));
    }

    return Parents(
        parents: parents,
        emptyTitle: 'Нажмите для добавления',
        onPressed: onPressed);
  }
}
