import 'dart:developer';

import 'package:familia_flutter/config.dart';
import 'package:familia_flutter/models/pagination.model.dart';
import 'package:familia_flutter/models/relative.model.dart';
import 'package:familia_flutter/services/relatives.service.dart';
import 'package:mobx/mobx.dart';

import '../models/searchData.model.dart';

part 'relatives.store.g.dart';

var relativesStore = RelativesStore();

class RelativesStore = RelativesStoreBase with _$RelativesStore;

abstract class RelativesStoreBase with Store {
  var isLoading = false;

  @observable
  SearchDataModel searchData =
      SearchDataModel(search: '', fields: ['name', 'about']);

  @observable
  var relatives = ObservableList<RelativeModel>.of([]);
  PaginationModel pagination =
      PaginationModel(page: 0, total: 0, pageSize: Config.pageSize);

  init() async {
    await loadData();
  }

  @action
  loadData({bool loadMore = false}) async {
    isLoading = true;
    var page = pagination.page;
    if (loadMore) {
      page ++;
    }
    var json = await RelativesService()
        .getRelatives(page: page, searchData: searchData);
    if (json != null) {
      var newData = (json['data'] as List<dynamic>)
          .map((item) => RelativeModel.fromJson(item))
          .toList();
      if (!loadMore) {
        relatives.clear();
      }
      relatives.addAll(newData);
      pagination = PaginationModel.fromJson(json['pagination']);
    }
    isLoading = false;
  }

  loadMore() async {
    await loadData(loadMore: true);
  }

  @action
  setSearch(String search) {
    searchData.search = search;
    loadData();
  }

  @action
  resetSearch() {
    searchData.search = '';
    loadData();
  }

  @computed
  bool get canLoadMore => !isLoading && relatives.length < pagination.total;
}
