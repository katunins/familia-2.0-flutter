import 'package:auto_route/auto_route.dart';
import 'package:familia_flutter/components/common/empty_data.dart';
import 'package:familia_flutter/components/root/scaffold_wrapper.dart';
import 'package:familia_flutter/models/search_store_bar.model.dart';
import 'package:familia_flutter/screens/relativesScreen/create_relative_screen.dart';
import 'package:familia_flutter/screens/relativesScreen/relatives_list_item.dart';
import 'package:familia_flutter/stores/relative_item.store.dart';
import 'package:familia_flutter/stores/relatives.store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../themes/margins.theme.dart';

class RelativesListScreen extends StatefulWidget {
  const RelativesListScreen({Key? key}) : super(key: key);

  static const pathName = 'relativesList';

  @override
  State<RelativesListScreen> createState() => _RelativesListScreenState();
}

class _RelativesListScreenState extends State<RelativesListScreen> {
  String search = '';

  setSearch(String val) {
    search = val;
    setState(() {});
  }

  floatingOnPressed() {
    context.router.pushNamed(CreateRelativeScreen.pathName);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      List<RelativeItemStore> data = relativesStore.relatives.where((element) {
        if (search == '') {
          return true;
        }
        return element.data.userData.name.contains(search) ||
            element.data.userData.about.contains(search);
      }).toList();

      return ScaffoldWrapper(
        floatingOnPressed: floatingOnPressed,
        searchBarStore:
            SearchBarStoreModel(search: search, setSearch: setSearch),
        body: relativesStore.relatives.isEmpty
            ? const Center(
                child: EmptyData(),
              )
            : Container(
                margin: EdgeInsets.symmetric(horizontal: marginHorizontal),
                child: ListView(
                  padding: const EdgeInsets.only(top: 4, bottom: 50),
                  children: data
                      .map((item) => RelativeListItem(relative: item))
                      .toList(),
                ),
              ),
      );
    });
  }
}
