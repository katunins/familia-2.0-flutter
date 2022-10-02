import 'package:dio/dio.dart';

class Config {

  String? deviceId;

  static const appStorageKey = 'familia_app';
  static const defaultUserName = 'Мой профиль';
  static const maxImageWidth = 600.0;
  static BaseOptions baseApiOptions = BaseOptions(
    baseUrl: 'https://familia.ikatunin.ru/',
    receiveTimeout: 15000,
    connectTimeout: 15000,
    sendTimeout: 15000,
    headers: {
      'version': '2.0',
    },
  );
}
