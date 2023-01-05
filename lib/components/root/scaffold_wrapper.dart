import 'package:auto_route/auto_route.dart';
import 'package:familia_flutter/models/search_store_bar.model.dart';
import 'package:familia_flutter/themes/colors.dart';
import 'package:flutter/material.dart';

import 'app_bar.dart';

class ScaffoldWrapper extends StatelessWidget {
  const ScaffoldWrapper(
      {Key? key,
      required this.body,
      this.floatingOnPressed,
      this.isUserPic = false,
      this.searchBarStore,
      this.title = ''})
      : super(key: key);

  final bool isUserPic;
  final Widget body;
  final Function()? floatingOnPressed;
  final SearchBarStoreModel? searchBarStore;
  final String title;

  Widget? get floatingActionButton {
    if (floatingOnPressed != null) {
      return FloatingActionButton(
        onPressed: floatingOnPressed,
        backgroundColor: AppColors.primaryColor,
        child: const Icon(Icons.add),
      );
    }
    return null;
  }

  PreferredSizeWidget? getAppBar(BuildContext context) {
    final tabsRouter = AutoTabsRouter.of(context);
    if (!tabsRouter.canPop() && title == '' && searchBarStore == null) {
      return null;
    }
    return PreferredSize(
      preferredSize: const Size.fromHeight(58),
      child: CustomAppBar(
        searchBarStore: searchBarStore,
        title: title,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingActionButton,
      body: body,
      appBar: getAppBar(context),
    );
  }
}
