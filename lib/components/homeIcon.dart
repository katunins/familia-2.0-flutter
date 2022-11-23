import 'package:familia_flutter/navigation/tabRoutes.dart';
import 'package:familia_flutter/stores/navigation.store.dart';
import 'package:flutter/material.dart';

var getHomeIcon = IconButton(
    icon: const Icon(Icons.home_outlined),
    onPressed: () => navigationStore.setCurrentTab(TabRoutes.home));