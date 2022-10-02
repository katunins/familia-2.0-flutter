class TokensModel {
  String? accessToken;
  String? refreshToken;

  TokensModel({this.accessToken, this.refreshToken});

  TokensModel.fromJson(Map<String, dynamic> json) {
    if (json['access_token'] != null) {
      accessToken = json['access_token'];
    }
    if (json['refresh_token'] != null) {
      refreshToken = json['refresh_token'] ?? '';
    }
  }
}
