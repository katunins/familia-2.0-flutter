import 'package:auto_route/auto_route.dart';
import 'package:familia_flutter/themes/margins.theme.dart';
import 'package:flutter/material.dart';
import '../../../models/search_store_bar.model.dart';
import '../../../themes/text.theme.dart';
import '../common/app_bar_input.dart';
import '../widgets/profile_user_pic.dart';

/// AppBar
/// title - строка заголовка
/// searchBarStore - search и setSearch для поиска

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.searchBarStore, this.title});

  final SearchBarStoreModel? searchBarStore;
  final String? title;

  Widget get titleWidget {
    if (searchBarStore != null) {
      return Flexible(
        child: MiniSearchInput(
          searchBarStore: searchBarStore!,
        ),
      );
    }
    if (title != null) {
      return Expanded(
          child: Text(title!,
              maxLines: 1,
              overflow: TextOverflow.fade,
              softWrap: false,
              style: appBarTitle));
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    final tabsRouter = AutoTabsRouter.of(context);
    double opacity = tabsRouter.activeIndex == 3 ? 1.0 : 0.7;

    return SizedBox(
      height: 60,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: marginHorizontal),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const AutoLeadingButton(),
            titleWidget,
            Opacity(
              opacity: opacity,
              child: Container(
                  margin: EdgeInsets.only(left: marginHorizontal),
                  child: const ProfileUserPic()),
            )
          ],
        ),
      ),
    );
  }
}
