import 'package:familia_flutter/models/pagination.model.dart';

class ApiResponseModel<T> {
  final List<T> data;
  final PaginationModel pagination;

  ApiResponseModel({required this.data, required this.pagination});
}