import 'package:familia_flutter/config.dart';

import '../main.dart';

isEmailFormat(String? email){
  if (email == null) {
    return false;
  }
  return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
}

getImageUrl(String? imageUrl) {
  if (imageUrl == null) return null;
  return Config.baseApiOptions.baseUrl + imageUrl;
}

getBearerToken(){
  return 'Bearer ${localStorage.read('access-token')}';
}