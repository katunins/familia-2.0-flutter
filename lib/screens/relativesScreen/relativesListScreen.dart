import 'package:familia_flutter/components/widgets/getScaffold.dart';
import 'package:familia_flutter/screens/relativesScreen/relativesListItem.dart';
import 'package:familia_flutter/stores/relatives.store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../components/appBarSearch.dart';
import '../../components/widgets/textFieldWidget.dart';
import '../../themes/margins.theme.dart';

class RelativesListScreen extends StatefulWidget {
  RelativesListScreen({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  State<RelativesListScreen> createState() => _RelativesListScreenState();
}

class _RelativesListScreenState extends State<RelativesListScreen> {
  Future<void> _onRefresh() async {}

  final _scrollController = ScrollController();
  
  @override
  void initState() {
    _scrollController.addListener(() async {
      if (_scrollController.offset > _scrollController.position.maxScrollExtent && relativesStore.canLoadMore) {
        await relativesStore.loadMore();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return getScaffold(
      customAppBarTitle:  AppBarSearchInput(
        initialValue: '',
        onChange: relativesStore.setSearch
      ),
        body: RefreshIndicator(
            onRefresh: _onRefresh,
            child: Observer(
                builder: (_) => Container(
                  margin: marginHorizontal,
                  child: ListView(
                    controller: _scrollController,
                    children: relativesStore.relatives.map((item) => RelativeListItem(relative: item)).toList(),
                  ),
                ))));
  }
}
