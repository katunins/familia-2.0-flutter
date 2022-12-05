import 'package:dio/dio.dart';
import 'package:familia_flutter/config.dart';
import 'package:familia_flutter/helpers/get.helper.dart';
import 'package:familia_flutter/helpers/util.helper.dart';
import 'package:familia_flutter/stores/app.store.dart';

class Api {
  late bool needToRefresh;
  final bool isMultipartData;
  final dio = Dio(Config.baseApiOptions);

  Api({this.needToRefresh = true, this.isMultipartData = false}) {
    dio.interceptors
        .add(QueuedInterceptorsWrapper(onRequest: onRequest, onResponse: onResponse, onError: onError));
  }

  onRequest(
      RequestOptions requestOptions, RequestInterceptorHandler handler) async {
    requestOptions.headers['authorization'] = getBearerToken();
    requestOptions.headers['device-id'] = appStore.deviceId;
    if (isMultipartData) {
      appStore.setIsLoading(true);
      requestOptions.headers["Content-Type"] = "multipart/form-data";
    }
    return handler.next(requestOptions);
  }

  onResponse(Response response, ResponseInterceptorHandler handler,){
    appStore.setIsLoading(false);
    return handler.next(response);
  }

  onError(DioError error, ErrorInterceptorHandler handler) async {
    var response = error.response;
    if (response != null && response.statusCode == 403 && needToRefresh) {
      await refreshTokenAndRepeatRequest(response: response, handler: handler);
      return;
    }

    var errorMessage = error.response?.data['message'];
    appStore.logOut();
    appStore.setIsLoading(false);
    if (errorMessage != null && errorMessage != '') {
      showPopup(middleText: errorMessage);
    }
  }

  refreshTokenAndRepeatRequest(
      {required Response response,
      required ErrorInterceptorHandler handler}) async {
    var refreshResult = await appStore.refreshToken();
    if (!refreshResult) {
      return;
    }
    var requestOptions = response.requestOptions;
    requestOptions.headers['Authorization'] =
        'Bearer ${appStore.tokens.accessToken}';
    await dio
        .request(
          requestOptions.path,
          data: requestOptions.data,
          queryParameters: requestOptions.queryParameters,
          options: Options(
            method: requestOptions.method,
            headers: requestOptions.headers,
          ),
        )
        .then((value) => handler.resolve(value))
        .onError((err, stackTrace) =>
            handler.reject(DioError(requestOptions: response.requestOptions)));
  }
}
