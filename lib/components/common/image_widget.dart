import 'package:familia_flutter/config.dart';
import 'package:familia_flutter/themes/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../helpers/util.helper.dart';

/// виджет для изображений
/// сам определяет откуда используется ссылка (файл или сеть)
/// также умеет кешировать изображение по-умолчанию

getImageWidget({
  String? path,
  double? width,
  double? height,
  BoxFit? fit,
  bool cache = true}) {
  if (path == null) {
    return Image.asset(AppImages.empty, width: width, fit: fit);
  }
  var isNetwork = path.contains(Config.baseApiOptions.baseUrl);
  if (isNetwork) {
    return cache
        ? CachedNetworkImage(
      httpHeaders: {'authorization': getBearerToken()},
      width: width,
      height: height,
      fit: fit,
      imageUrl: path,
    ) : Image.network(path, headers: {'authorization': getBearerToken()},
      width: width,
      height: height,
      fit: fit);
  } else {
    return Image.asset(path);
  }
}
