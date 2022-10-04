import 'package:familia_flutter/screens/loadingScreen.dart';
import 'package:familia_flutter/screens/mainScreen/mainScreen.dart';
import 'package:familia_flutter/screens/signInScreen/signInScreen.dart';
import 'package:familia_flutter/screens/userScreens/setUserDataScreen.dart';
import 'package:familia_flutter/stores/app.store.dart';
import 'package:familia_flutter/stores/user.store.dart';
import 'package:familia_flutter/themes/main.theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'config.dart';
import 'navigation/navBody.dart';

final localStorage = GetStorage(Config.appStorageKey);
var dateFormat = DateFormat("dd-MM-yyyy");
final ImagePicker imagePicker = ImagePicker();
final globalKey = GlobalKey<NavigatorState>();

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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: isAppInit,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          var isReadyToInit = snapshot.connectionState == ConnectionState.done;
          return MaterialApp(
            navigatorKey: globalKey,
            debugShowCheckedModeBanner: false,
            theme: getThemeData(context),
            home: isReadyToInit ? const NavBody() : const LoadingPage(),
          );
        });
  }
}
