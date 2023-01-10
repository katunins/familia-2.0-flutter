import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../components/root/custom_bottom_navigation_bar.dart';
import '../../routers/app_router.gr.dart';

class MainRootScreen extends StatelessWidget {
  const MainRootScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return SafeArea(child: AutoTabsScaffold(
      bottomNavigationBuilder: (_, tabsRouter) =>
          CustomBottomNavigationBar(tabsRouter: tabsRouter),
      routes: [
        TreeRouter(),
        const NotesRouter(),
        const RelativesRouter(),
        const ProfileRouter()
      ],
    ));
  }
}
