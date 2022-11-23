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
        body: Container(
      )
    );
  }
}