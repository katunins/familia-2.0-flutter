import 'package:familia_flutter/models/search_store_bar.model.dart';
import 'package:flutter/material.dart';
import '../../../helpers/util.helper.dart';
import '../../../models/tree_element.dart';
import '../common/app_bar_input.dart';

/// BottomSheet со списком пользователея и родственников, которые можно выбрать
/// excluded - список id, которые нужно исключить из списка
/// onSelected (userId) - callBack выбора

class RelativesListSheet extends StatefulWidget {
  const RelativesListSheet({Key? key, required this.onSelected, this.excluded})
      : super(key: key);

  final Function(String userId) onSelected;
  final List<String>? excluded;

  @override
  State<RelativesListSheet> createState() => _RelativesListSheetState();
}

class _RelativesListSheetState extends State<RelativesListSheet> {
  List<TreeElementModel> elements = [];
  String search = '';

  @override
  void initState() {
    elements = getAllUsers(excluded: widget.excluded);
    setState(() {});
    super.initState();
  }

  setSearch(String val) {
    search = val;
    setState(() {});
  }

  List<TreeElementModel> get filteredElements => elements
      .where((item) => item.title!.toUpperCase().contains(search.toUpperCase()))
      .toList();

  @override
  Widget build(BuildContext context) {
    double containerHeight =
        MediaQuery.of(context).viewInsets.bottom == 0 ? 400 : 200;

    return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
            height: containerHeight,
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      left: 12.0, right: 12.0, bottom: 12.0),
                  child: MiniSearchInput(
                    searchBarStore: SearchBarStoreModel(
                    search: search,
                    setSearch: setSearch),
                  ),
                ),
                Expanded(
                    child: filteredElements.isEmpty
                        ? Container()
                        : ListView.builder(
                            itemCount: filteredElements.length,
                            prototypeItem: ListTile(
                              title: Text(filteredElements.first.title!),
                            ),
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: GestureDetector(
                                  onTap: () {
                                    widget
                                        .onSelected(filteredElements[index].id);
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(filteredElements[index].title!),
                                ),
                              );
                            },
                          ))
              ],
            )));
  }
}
