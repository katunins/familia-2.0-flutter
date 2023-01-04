import 'package:auto_route/auto_route.dart';
import 'package:familia_flutter/components/common/customBottomNavigationBar.dart';
import 'package:flutter/material.dart';
import '../../components/common/appBar.dart';
import '../../routers/appRouter.gr.dart';



class MainRootScreen extends StatelessWidget {
  const MainRootScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: AutoTabsScaffold(
      bottomNavigationBuilder: (_, tabsRouter) =>
          CustomBottomNavigationBar(tabsRouter: tabsRouter),
      routes: const [
        NotesRouter(),
        TreeRouter(),
        RelativesRouter(),
        ProfileRouter()
      ],
    ));
  }
}
