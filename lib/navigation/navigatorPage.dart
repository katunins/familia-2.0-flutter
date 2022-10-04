import 'package:familia_flutter/navigation/routes.dart';
import 'package:flutter/cupertino.dart';

class NavigatorPage {
  final Routes routes;
  final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  NavigatorPage({required this.routes});
}
