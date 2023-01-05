import 'package:auto_route/auto_route.dart';
import 'package:familia_flutter/components/common/button.dart';
import 'package:familia_flutter/components/common/user_pic.dart';
import 'package:familia_flutter/models/search_store_bar.model.dart';
import 'package:familia_flutter/themes/margins.theme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../../helpers/util.helper.dart';
import '../../../models/tree_element.dart';
import '../../helpers/bottom_sheet.dart';
import '../../routers/app_router.gr.dart';
import '../common/app_bar_input.dart';

/// BottomSheet со списком пользователея и родственников, которые можно выбрать
/// excluded - список id, которые нужно исключить из списка
/// onSelected (userId) - callBack выбора
/// hideAddRelativeButton - скрыть кнопку добавления родственника

class RelativesListSheet extends StatefulWidget {
  const RelativesListSheet(
      {Key? key,
      required this.onSelected,
      this.excluded,
      this.hideAddRelativeButton = false})
      : super(key: key);

  final Function(String userId) onSelected;
  final List<String>? excluded;
  final bool hideAddRelativeButton;

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

  addUserCallback() {
    context.router.popAndPush(CreateNewRelativeRouter(
        hideBottomSheetAddRelativeButton: true,
        finishCallback: (relativeId) {
          if (relativeId == null) {
            return;
          }
          widget.onSelected(relativeId);
          BottomSheetHelper.message(
              context: GetIt.I<AppRouter>().navigatorKey.currentState!.context,
              message:
                  'Новый родственник добавлен в качестве родителя. Не забудьте сохранить изменения');
        }));
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
                        search: search, setSearch: setSearch),
                  ),
                ),
                Expanded(
                    child: filteredElements.isEmpty
                        ? const Center(
                            child: Text('Список пуст'),
                          )
                        : ListView.builder(
                            itemCount: filteredElements.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: GestureDetector(
                                  onTap: () {
                                    widget
                                        .onSelected(filteredElements[index].id);
                                    Navigator.of(context).pop();
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(
                                              right: marginHorizontal),
                                          child: UserPic(
                                            userPic:
                                                filteredElements[index].userPic,
                                            size: 32,
                                          )),
                                      Expanded(
                                          child: Text(
                                              filteredElements[index].title!))
                                    ],
                                  ),
                                ),
                              );
                            },
                          )),
                if (!widget.hideAddRelativeButton)
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: marginHorizontal),
                    child: AppButton(
                        title: 'Добавить родтсвенника',
                        onPressed: addUserCallback,
                        type: IAppButtonTypes.secondary),
                  )
              ],
            )));
  }
}
