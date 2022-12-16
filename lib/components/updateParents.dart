import 'package:familia_flutter/components/parents.dart';
import 'package:familia_flutter/components/relativesListSheet.dart';
import 'package:familia_flutter/models/parents.model.dart';
import 'package:familia_flutter/models/relative.model.dart';
import 'package:familia_flutter/models/treeElement.dart';
import 'package:familia_flutter/stores/relatives.store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../stores/user.store.dart';

class UpdateParents extends StatelessWidget {
  const UpdateParents(
      {Key? key, required this.parents, required this.onSelected})
      : super(key: key);

  final ParentsModel? parents;
  final Function({required String oldParentId, required String newParentId})
      onSelected;

  get getElements {

    List<TreeElementModel> result = [];
    for (var relativeId in parents?.toList() ?? []) {
      TreeElementModel? treeElement = relativeId == userStore.user!.id ? userStore.user!.toTreeElement() : relativesStore.getRelativeById(relativeId)?.toTreeElement();

      if (treeElement != null) {
        result.add(treeElement);
      }
    }

    while (result.length < 2) {
      result.add(TreeElementModel.empty());
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {

    onPressed(String oldParentId) {
      showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
                topRight: Radius.circular(16)
            ),
          ),
          builder: (_) => RelativesListSheet(
              onSelected: (String newParentId) => onSelected(
                  oldParentId: oldParentId, newParentId: newParentId)));
    }

    return Parents(elements: getElements, editMode: true, onPressed: onPressed);
  }
}
