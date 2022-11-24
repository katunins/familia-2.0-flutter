import 'package:familia_flutter/stores/app.store.dart';
import 'package:mobx/mobx.dart';
import '../navigation/tabRoutes.dart';

part 'navigation.store.g.dart';

var navigationStore = NavigationStore();
const initialRoute = TabRoutes.home;

class NavigationStore = NavigationStoreBase with _$NavigationStore;

abstract class NavigationStoreBase with Store {
  @observable
  var _currentAppRoute = initialRoute;

  @computed
  get currentAppRoute => appStore.isAuth ? _currentAppRoute : TabRoutes.guest;

  @computed
  get currentKey => TabRoutes.navigatorPages[_currentAppRoute.index].navKey;

  @action
  void setCurrentTab(TabRoutes appRoute) {
    _currentAppRoute = appRoute;
  }

  clear(){
    setCurrentTab(initialRoute);
  }
}
