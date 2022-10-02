import 'dart:io';
import 'package:familia_flutter/config.dart';
import 'package:flutter/cupertino.dart';

import 'networkImage.dart';

getImageWidget (String path){
  var isNetwork = path.contains(Config.baseApiOptions.baseUrl);
  if (isNetwork){
    return Image(image: getNetworkImage(path));
  } else {
    return Image.file(File(path));
  }
}