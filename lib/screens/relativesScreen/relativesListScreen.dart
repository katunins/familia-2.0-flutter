import 'package:familia_flutter/components/widgets/scaffold.dart';
import 'package:familia_flutter/screens/relativesScreen/relativesListItem.dart';
import 'package:familia_flutter/stores/relativeItem.store.dart';
import 'package:familia_flutter/stores/relatives.store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../themes/margins.theme.dart';

class RelativesListScreen extends StatefulWidget {
  const RelativesListScreen({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  State<RelativesListScreen> createState() => _RelativesListScreenState();
}

class _RelativesListScreenState extends State<RelativesListScreen> {
  var search = '';

  setSearch(String val) {
    setState(() {
      search = val;
    });
  }

  List<RelativeItemStore> getFilteredData() {
    return relativesStore.relatives.where((element) {
      if (search == '') {
        return true;
      }
      return element.data.userData.name.contains(search) || element.data.userData.about.contains(search);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        isUserPick: true,
        isHomeButton: true,
        setSearch: setSearch,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: marginHorizontal),
          child: Observer(
            builder: (_) => ListView(
              children: getFilteredData()
                  .map((item) => RelativeListItem(relative: item))
                  .toList(),
            ),
          ),
        ));
  }
}
