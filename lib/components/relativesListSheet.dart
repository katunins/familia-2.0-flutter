import 'package:flutter/material.dart';

import '../models/treeElement.dart';
import '../stores/relatives.store.dart';
import '../stores/user.store.dart';

class RelativesListSheet extends StatelessWidget {
  RelativesListSheet({Key? key, required this.onSelected}) : super(key: key);

  final Function(String parentId) onSelected;
  final List<TreeElementModel> elements = [
    ...relativesStore.relatives
        .map((item) => item.data.toTreeElement())
        .toList(),
    userStore.user!.toTreeElement()
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        itemCount: elements.length,
        prototypeItem: ListTile(
          title: Text(elements.first.title),
        ),
        itemBuilder: (context, index) {
          return ListTile(
            title: GestureDetector(
              onTap: () {
                onSelected(elements[index].id);
                Navigator.of(context).pop();
              },
              child: Text(elements[index].title),
            ),
          );
        },
      ),
    );
  }
}
