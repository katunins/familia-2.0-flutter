import 'package:familia_flutter/helpers/util.helper.dart';
import 'package:flutter/cupertino.dart';

getNetworkImage(String url) =>
    NetworkImage(url, headers: {'authorization': getBearerToken()});
