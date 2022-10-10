import 'dart:developer';

class PaginationModel {
  late int page;
  late int total;
  late int pageSize;

  PaginationModel({required this.page, required this.total, required this.pageSize});

  PaginationModel.fromJson(Map<String, dynamic> json) {
    page = int.parse(json['page'].toString());
    total = int.parse(json['total'].toString());
    pageSize = int.parse(json['pageSize'].toString());
  }
}