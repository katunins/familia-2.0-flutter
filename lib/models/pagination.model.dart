import 'package:familia_flutter/config.dart';

class PaginationModel {
  int page = 0;
  int total = 0;
  int pageSize = Config.pageSize;

  PaginationModel();

  PaginationModel.fromJson(Map<String, dynamic> json) {
    page = int.parse(json['page'].toString());
    total = int.parse(json['total'].toString());
    pageSize = int.parse(json['pageSize'].toString());
  }

}