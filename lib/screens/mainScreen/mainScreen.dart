import 'package:familia_flutter/components/widgets/scaffold.dart';
import 'package:familia_flutter/routes.dart';
import 'package:familia_flutter/stores/navigation.store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  static const routeName = '/mainScreen';

  @override
  Widget build(BuildContext context) {
    return getScaffold(
      body: Container(
        child: Text(navigationStore.globalKey.toString(), style: Theme.of(context).textTheme.displaySmall,),
      )
    );
  }
}
