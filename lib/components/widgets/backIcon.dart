import 'package:flutter/material.dart';

import '../../navigation/tabRoutes.dart';
import '../../stores/navigation.store.dart';

var getBackIcon = IconButton(
    onPressed: () => navigationStore.setCurrentTab(TabRoutes.home),
    icon: const Icon(Icons.arrow_back_ios));