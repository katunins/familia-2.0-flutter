import 'package:auto_route/auto_route.dart';
import 'package:familia_flutter/components/widgets/scaffoldWrapper.dart';
import 'package:familia_flutter/models/searchStoreBar.model.dart';
import 'package:familia_flutter/screens/relativesScreen/createRelativeScreen.dart';
import 'package:familia_flutter/screens/relativesScreen/relativesListItem.dart';
import 'package:familia_flutter/stores/relativeItem.store.dart';
import 'package:familia_flutter/stores/relatives.store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../themes/margins.theme.dart';

class RelativesListScreen extends StatefulWidget {
  const RelativesListScreen({Key? key}) : super(key: key);

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
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: marginHorizontal),
          child: ListView(
            padding: const EdgeInsets.only(top: 4, bottom: 50),
            children:
                data.map((item) => RelativeListItem(relative: item)).toList(),
          ),
        ),
      );
    });
  }
}
