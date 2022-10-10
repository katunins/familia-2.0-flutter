import 'dart:convert';
import 'dart:developer';

import 'package:familia_flutter/models/baseUserData.model.dart';
import 'package:familia_flutter/models/pagination.model.dart';
import 'package:familia_flutter/models/parents.model.dart';

import '../helpers/util.helper.dart';

class RelativesModel {
  late List<RelativeModel> data;
  late PaginationModel pagination;

  RelativesModel({required this.data, required this.pagination});

  RelativesModel.fromJson(Map<String, dynamic> json) {
    data = (json['data'] as List<dynamic>).map((item) => RelativeModel.fromJson(item)).toList();
    pagination = PaginationModel.fromJson(json['pagination']);
  }
}

class RelativeModel {
  late String id;
  late BaseUserDataModel userData;
  late RelativeAccessModel access;

  RelativeModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    userData = BaseUserDataModel(
      userPic: getImageUrl(json['userPic']),
      about: json['about'],
      name: json['name'],
      parents: ParentsModel.fromJson(json['parents']),
    );
    access = RelativeAccessModel.fromJson(json['access']);
  }
}

class RelativeAccessModel {
  late String creatorId;
  late List<String> shareId;

  RelativeAccessModel({required this.creatorId, required this.shareId});

  RelativeAccessModel.fromJson(Map<String, dynamic> json) {
    creatorId = json['creatorId'];
    shareId = (json['shareId'] as List).map((item) => item.toString()).toList();
  }
}
