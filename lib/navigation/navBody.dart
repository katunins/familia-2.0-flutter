import 'package:familia_flutter/navigation/tabRoutes.dart';
import 'package:familia_flutter/stores/app.store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../stores/navigation.store.dart';
import 'tabRoutes.dart';

class NavBody extends StatelessWidget {
  const NavBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => WillPopScope(
            onWillPop: () async {
              NavigatorState? currentNavState = navigationStore
                  .currentAppRoute.navigatorPage.navKey.currentState;

              if (currentNavState?.canPop() ?? true) {
                currentNavState?.pop();
                return false;
              } else {
                return true;
              }
            },
          child: IndexedStack(
            index: navigationStore.currentAppRoute.index,
            children: TabRoutes.navigatorPages.map((page) => Navigator(
              key: page.navKey,
              onGenerateRoute: page.routes.getRoute,
            )).toList(),
          ),
        ));
  }
}
