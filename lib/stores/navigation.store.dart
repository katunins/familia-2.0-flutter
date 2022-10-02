import 'package:familia_flutter/stores/app.store.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobx/mobx.dart';
import '../main.dart';
import '../routes.dart';

part 'navigation.store.g.dart';

var navigationStore = NavigationStore();

class NavigationStore = NavigationStoreBase with _$NavigationStore;

abstract class NavigationStoreBase with Store {

  @observable
  var globalKey = AppGlobalKeys.main.globalKey;

  @action
  setGlobalKey(AppGlobalKeys value){
    globalKey = value.globalKey;
  }

  push(String route, {Object? arguments}) {
      globalKey?.currentState?.pushNamed(route, arguments: arguments);
  }

  pushReplacement(String route, {Object? arguments}) {
    globalKey?.currentState?.pushReplacementNamed(route, arguments: arguments);
  }

  back() {
    globalKey?.currentState?.pop();
  }

  clear() {
    globalKey?.currentState?.popUntil((route) => route.isFirst);
  }
}
