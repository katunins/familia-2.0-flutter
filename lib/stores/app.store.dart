import 'package:familia_flutter/config.dart';
import 'package:familia_flutter/models/tokens.model.dart';
import 'package:familia_flutter/services/auth.service.dart';
import 'package:familia_flutter/stores/navigation.store.dart';
import 'package:familia_flutter/stores/user.store.dart';
import 'package:mobx/mobx.dart';
import 'package:platform_device_id/platform_device_id.dart';

import '../main.dart';

part 'app.store.g.dart';

var appStore = AppStore();

class AppStore = AppStoreBase with _$AppStore;

abstract class AppStoreBase with Store {
  @observable
  var tokens = TokensModel();

  String? deviceId;

  @computed
  bool get isAuth => userStore.user != null;

  Future? initApp() async {
    await localStorage.initStorage;
    await initDeviceId();
    initTokensFromStorage();
    if (tokens?.accessToken != null) {
      await initAuthApp();
    }
    return;
  }

  initAuthApp() async {
    await userStore.init();
    if (!appStore.isAuth) {
      return;
    }
  }

  @action
  initDeviceId() async {
    var result = await PlatformDeviceId.getDeviceId;
    if (result != null) {
      deviceId = result;
    }
  }

  @action
  initTokensFromStorage() async {
    tokens = TokensModel(
        accessToken: localStorage.read('access-token'),
        refreshToken: localStorage.read('refresh-token'));
  }

  Future<bool> refreshToken() async {
    if (tokens.refreshToken == null) {
      return false;
    }
    var newTokens = await AuthService().getRefreshTokens();
    if (newTokens == null) {
      return false;
    }
    setTokens(newTokens);
    return true;
  }

  @action
  setTokens(TokensModel tokensModel) async {
    tokens = tokensModel;
    await localStorage.write('access-token', tokensModel.accessToken);
    await localStorage.write('refresh-token', tokensModel.refreshToken);
  }

  @action
  logOut() async {
    navigationStore.clear();
    userStore.resetUser();
    await localStorage.remove('access-token');
    await localStorage.remove('refresh-token');
  }
}
