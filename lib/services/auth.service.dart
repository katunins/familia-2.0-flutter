import 'package:familia_flutter/models/tokens.model.dart';
import 'package:familia_flutter/stores/app.store.dart';

import 'api.dart';

class AuthService {
  final apiUrl = 'auth';

  Future<TokensModel?> getRefreshTokens() async {
    var queryParameters = {'refresh_token': appStore.tokens.refreshToken};
    var response = await Api(needToRefresh: false)
        .dio
        .get('$apiUrl/refresh', queryParameters: queryParameters);
    if (response.statusCode != 200) {
      return null;
    }
    var newTokens = TokensModel.fromJson(response.data);
    return newTokens;
  }

  Future<TokensModel?> signIn(
      {required String email, required String password}) async {
    var queryParameters = {'email': email, 'password': password};
    var response = await Api(needToRefresh: false)
        .dio
        .get(apiUrl, queryParameters: queryParameters);
    if (response.statusCode != 200) {
      return null;
    }
    return TokensModel.fromJson(response.data);
  }

  Future<TokensModel?> signUp(
      {required String email, required String password}) async {
    var data = {'email': email, 'password': password};
    var response = await Api(needToRefresh: false).dio.post(apiUrl, data: data);
    if (response.statusCode != 201) {
      return null;
    }
    return TokensModel.fromJson(response.data);
  }
}
