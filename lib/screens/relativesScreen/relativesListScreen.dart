import 'package:familia_flutter/components/widgets/getScaffold.dart';
import 'package:familia_flutter/screens/relativesScreen/relativesListItem.dart';
import 'package:familia_flutter/stores/relatives.store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../components/widgets/textFieldWidget.dart';
import '../../themes/margins.theme.dart';

class RelativesListScreen extends StatelessWidget {
  RelativesListScreen({Key? key}) : super(key: key);

  static const routeName = '/';

  Future<void> _onRefresh() async {}
  var controller = TextEditingController(text: relativesStore.searchData.search);

  @override
  Widget build(BuildContext context) {
    return getScaffold(
      customAppBarTitle:  TextFieldWidget(
          controller: controller,
          onChanged: relativesStore.setSearch,
          isNoBorder: true
      ),
        body: RefreshIndicator(
            onRefresh: _onRefresh,
            child: Observer(
                builder: (_) => Container(
                  margin: marginHorizontal,
                  child: ListView(
                    children: relativesStore.relatives.data.map((item) => RelativeListItem(relative: item)).toList()
                  ),
                ))));
  }
}
