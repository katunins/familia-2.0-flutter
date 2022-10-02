import 'package:familia_flutter/routes.dart';
import 'package:familia_flutter/screens/loadingScreen.dart';
import 'package:familia_flutter/screens/mainScreen/mainScreen.dart';
import 'package:familia_flutter/screens/signInScreen/signInScreen.dart';
import 'package:familia_flutter/screens/userScreens/setUserDataScreen.dart';
import 'package:familia_flutter/stores/app.store.dart';
import 'package:familia_flutter/stores/navigation.store.dart';
import 'package:familia_flutter/stores/user.store.dart';
import 'package:familia_flutter/themes/main.theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'config.dart';

final localStorage = GetStorage(Config.appStorageKey);
var dateFormat = DateFormat("dd-MM-yyyy");
final ImagePicker imagePicker = ImagePicker();

enum TabItem {
  red(Colors.red),
  green(Colors.green),
  blue(Colors.blue);

  const TabItem(this.color);
  final MaterialColor color;
}

void main() {
  runApp(const GetMaterialApp(home: Root()));
}

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  var isAppInit = appStore.initApp();

  getHomeScreen() {

    if (!appStore.isAuth) {
      return const SignInScreen();
    }
    if (!userStore.hasRequiredUserData) {
      return SetUserDataScreen();
    }
    return const MainScreen();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: isAppInit,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          var isReadyToInit = snapshot.connectionState == ConnectionState.done;
          return Observer(
              builder: (_) {
                return MaterialApp(
                    navigatorKey: navigationStore.globalKey,
                    debugShowCheckedModeBanner: false,
                    routes: getRoutes(),
                    theme: getThemeData(context),
                    home: isReadyToInit ? getHomeScreen() : const LoadingPage(),
                );
              });
        });
  }
}
