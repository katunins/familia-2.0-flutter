import 'package:familia_flutter/components/widgets/getScaffold.dart';
import 'package:familia_flutter/screens/relativesScreen/relativesListItem.dart';
import 'package:familia_flutter/stores/relativeItem.store.dart';
import 'package:familia_flutter/stores/relatives.store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../components/appBarSearch.dart';
import '../../components/widgets/textFieldWidget.dart';
import '../../themes/margins.theme.dart';

class RelativesListScreen extends StatefulWidget {
  const RelativesListScreen({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  State<RelativesListScreen> createState() => _RelativesListScreenState();
}

class _RelativesListScreenState extends State<RelativesListScreen> {
  // Future<void> _onRefresh() async {}
  String search = '';
  // List<RelativeItemStore> data = [];

  setSearch(String val){
    setState(() {
      search = val;
    });
  }
  // final _scrollController = ScrollController();
  
  @override
  void initState() {
    // data = relativesStore.relatives.map((item) => RelativeListItem(relative: item)).toList();
    // _scrollController.addListener(() async {
    //   if (_scrollController.offset > _scrollController.position.maxScrollExtent && relativesStore.canLoadMore) {
    //     await relativesStore.loadMore();
    //   }
    // });
    super.initState();
  }

  List<RelativeItemStore> getFilteredData () {
    return relativesStore.relatives.where((element) {
      if (search == ''){
        return true;
      }
      return (element.data.userData.name ?? '').contains(search) || (element.data.userData.about ?? '').contains(search);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return getScaffold(
      customAppBarTitle:  AppBarSearchInput(
        initialValue: '',
        onChange: setSearch
      ),
        body: Container(
          margin: marginHorizontal,
          child: ListView(
            // controller: _scrollController,
            children: getFilteredData().map((item) => RelativeListItem(relative: item)).toList(),
          ),
        ));
  }
}
