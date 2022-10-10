import 'dart:io';
import 'package:familia_flutter/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../helpers/util.helper.dart';

getImageWidget(
    {required String path,
    double? width,
    double? height,
    BoxFit? fit,
    bool cache = true}) {
  var isNetwork = path.contains(Config.baseApiOptions.baseUrl);
  if (isNetwork) {
    return cache
        ? CachedNetworkImage(
            httpHeaders: {'authorization': getBearerToken()},
            width: width,
            height: height,
            fit: fit,
            imageUrl: path,
            // placeholder: (context, url) => const CircularProgressIndicator(),
            // errorWidget: (context, url, error) => const Icon(Icons.error)
    )
        : NetworkImage(
            path,
            headers: {'authorization': getBearerToken()},
          );
    // return Image(image: getNetworkImage(path), width: width, height: height, fit: fit,);
  } else {
    return Image.file(File(path), width: width, fit: fit);
  }
}
