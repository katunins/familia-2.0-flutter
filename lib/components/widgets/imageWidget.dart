import 'dart:io';
import 'package:familia_flutter/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../helpers/util.helper.dart';

getImageWidget(
    {String? path,
    double? width,
    double? height,
    BoxFit? fit,
    bool cache = true}) {
  if (path == null){
    return Image.asset('images/empty.jpg', width: width, fit: fit);
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
    )
        : NetworkImage(
            path,
            headers: {'authorization': getBearerToken()},
          );
  } else {
    return Image.file(File(path), width: width, fit: fit);
  }
}
