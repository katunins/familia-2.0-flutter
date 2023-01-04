import 'package:familia_flutter/helpers/util.helper.dart';
import 'package:familia_flutter/routers/appRouter.gr.dart';
import 'package:familia_flutter/routers/guestRouter.gr.dart';
import 'package:familia_flutter/screens/splashScreen.dart';
import 'package:familia_flutter/stores/app.store.dart';
import 'package:familia_flutter/themes/main.theme.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final dateFormat = DateFormat("dd-MM-yyyy");
final ImagePicker imagePicker = ImagePicker();
final globalKey = GlobalKey<ScaffoldMessengerState>();
final guestRouter = GuestRouter();
final appRouter = AppRouter();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  GetIt.I.registerSingleton<SharedPreferences>(prefs);
  GetIt.I.registerSingleton<AppRouter>(appRouter);
  GetIt.I.registerSingleton<GlobalKey<ScaffoldMessengerState>>(globalKey);

  runApp(const Root());
}

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  bool showSplash = true;

  afterInit(_) {
    showSplash = false;
    setState(() {});
  }

  @override
  void initState() {
    appStore.initApp()?.then(afterInit).onError((error, _) {
      showSnackBar(error.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        scaffoldMessengerKey: globalKey,
        debugShowCheckedModeBanner: false,
        theme: getThemeData(context),
        home: showSplash
            ? const SplashScreen()
            : appStore.isAuth
                ? Router(
                    routerDelegate: appRouter.delegate(),
                    routeInformationParser: appRouter.defaultRouteParser(),
                    routeInformationProvider: appRouter.routeInfoProvider(),
                  )
                : Router(
                    routerDelegate: guestRouter.delegate(),
                    routeInformationParser: guestRouter.defaultRouteParser(),
                    routeInformationProvider: guestRouter.routeInfoProvider(),
                  ));
  }
}
