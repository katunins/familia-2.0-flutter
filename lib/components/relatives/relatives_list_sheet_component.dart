import 'package:familia_flutter/components/common/button.dart';
import 'package:familia_flutter/models/tree_element.dart';
import 'package:flutter/material.dart';

import '../../models/search_store_bar.model.dart';
import '../../themes/sizes.dart';
import '../common/app_bar_input.dart';
import '../common/user_pic.dart';

/// Компонет списка родственников для bottomSheet
/// searchBarStore - search и setSearch для фильтра Поиск
/// relatives - пользователи
/// onTapElement - callBack при клике возвращает id пользователя
/// checkBox - чекбокс справа (для мульти выбора)
/// button - кнопка в конце списка

class RelativesListSheetComponent extends StatefulWidget {
  const RelativesListSheetComponent(
      {Key? key,
      required this.relatives,
      required this.onTapElement,
      this.getCheckBox,
      this.button})
      : super(key: key);

  final List<TreeElementModel> relatives;
  final Function(String) onTapElement;
  final Widget Function(String)? getCheckBox;
  final AppButton? button;

  @override
  State<RelativesListSheetComponent> createState() =>
      _RelativesListSheetComponentState();
}

class _RelativesListSheetComponentState
    extends State<RelativesListSheetComponent> {
  List<TreeElementModel> elements = [];
  var search = '';

  @override
  void initState() {
    elements = widget.relatives;
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
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        height: MediaQuery.of(context).viewInsets.bottom == 0 ? 400 : 200,
        margin: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin:
                  const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 12.0),
              child: MiniSearchInput(
                searchBarStore:
                    SearchBarStoreModel(search: search, setSearch: setSearch),
              ),
            ),
            Expanded(
                child: widget.relatives.isEmpty
                    ? const Center(
                        child: Text('Список пуст'),
                      )
                    : ListView.builder(
                        itemCount: filteredElements.length,
                        itemBuilder: (context, index) => ListTile(
                          title: GestureDetector(
                            onTap: () =>
                                widget.onTapElement(filteredElements[index].id),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    margin: EdgeInsets.only(
                                        right: AppSizes.marginHorizontal),
                                    child: UserPic(
                                      userPic: filteredElements[index].userPic,
                                      size: 32,
                                    )),
                                Expanded(
                                    child:
                                        Text(filteredElements[index].title!)),
                                if (widget.getCheckBox != null)
                                  Container(
                                    margin: EdgeInsets.only(left: AppSizes.marginHorizontal),
                                    child: widget.getCheckBox!(filteredElements[index].id),
                                  )
                              ],
                            ),
                          ),
                        ),
                      )),
            if (widget.button != null)
              Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: AppSizes.marginHorizontal),
                  child: widget.button!)
          ],
        ),
      ),
    );
  }
}
