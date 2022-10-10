import 'dart:io';
import 'package:familia_flutter/config.dart';
import 'package:flutter/cupertino.dart';

import 'networkImage.dart';

getImageWidget ({required String path, double? width, double? height, BoxFit? fit}){
  var isNetwork = path.contains(Config.baseApiOptions.baseUrl);
  if (isNetwork){
    return Image(image: getNetworkImage(path), width: width, height: height, fit: fit,);
  } else {
    return Image.file(File(path), width: width, fit: fit);
  }
}