import 'package:familia_flutter/components/widgets/getScaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isUserPick: true,
        body: Center(
          child: Column(
            children: [
              Text('headline5', style: Theme.of(context).textTheme.headline5),
            Text('subtitle1', style: Theme.of(context).textTheme.subtitle1),
            Text('subtitle2', style: Theme.of(context).textTheme.subtitle2),
            ],
          ),
      )
    );
  }
}