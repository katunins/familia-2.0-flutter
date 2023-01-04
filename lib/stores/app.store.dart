import 'package:familia_flutter/models/tokens.model.dart';
import 'package:familia_flutter/services/auth.service.dart';
import 'package:familia_flutter/stores/notes.store.dart';
import 'package:familia_flutter/stores/relatives.store.dart';
import 'package:familia_flutter/stores/user.store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app.store.g.dart';

var appStore = AppStore();

class AppStore = AppStoreBase with _$AppStore;

abstract class AppStoreBase with Store {

  @observable
  var isLoading = false;

  @observable
  var isShowSplash = true;

  @observable
  var tokens = TokensModel();

  String? deviceId;

  @computed
  bool get isAuth => userStore.user != null;

  Future? initApp() async {
    initTokensFromStorage();
    await initDeviceId();
    if (tokens.accessToken != null) {
      await initAuthApp();
    }
    stopSplash();
  }

  initAuthApp() async {
    await userStore.init();
    await relativesStore.init();
    await notesStore.init();
  }

  @action
  initDeviceId() async {
    var result = await PlatformDeviceId.getDeviceId;
    if (result != null) {
      deviceId = result;
    }
  }

  @action
  stopSplash(){
    isShowSplash = false;
  }

  @action
  initTokensFromStorage() {
    var prefs = GetIt.I<SharedPreferences>();
    tokens = TokensModel(
        accessToken: prefs.getString('access-token'),
        refreshToken: prefs.getString('refresh-token'));
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
    var prefs = GetIt.I<SharedPreferences>();
    if (tokensModel.accessToken != null) {
      await prefs.setString('access-token', tokensModel.accessToken!);
    }
    if (tokensModel.refreshToken != null) {
      await prefs.setString('refresh-token', tokensModel.refreshToken!);
    }
  }

  @action
  signIn({required String email, required String password}) async {
    var prefs = GetIt.I<SharedPreferences>();
    await prefs.setString('email', email);

    var tokens = await AuthService().signIn(email: email, password: password);
    if (tokens == null) {
      return;
    }
    await setTokens(tokens);
    await initAuthApp();
  }

  @action
  signUp({required String email, required String password}) async {

    var tokens = await AuthService().signUp(email: email, password: password);
    if (tokens == null) {
      return;
    }
    await setTokens(tokens);
    await initAuthApp();
  }

  @action
  logOut() async {
    userStore.resetUser();
    var prefs = GetIt.I<SharedPreferences>();
    await prefs.remove('access-token');
    await prefs.remove('refresh-token');
    if (isShowSplash) {
      stopSplash();
    }
  }

  @action
  setIsLoading(bool value) => isLoading = value;
}
