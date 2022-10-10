import 'package:familia_flutter/models/pagination.model.dart';
import 'package:familia_flutter/models/relative.model.dart';
import 'package:familia_flutter/services/relatives.service.dart';
import 'package:mobx/mobx.dart';

import '../models/searchData.model.dart';

part 'relatives.store.g.dart';

var relativesStore = RelativesStore();

class RelativesStore = RelativesStoreBase with _$RelativesStore;

abstract class RelativesStoreBase with Store {

  @observable
  SearchDataModel searchData = SearchDataModel(search: '',fields: ['name', 'about']);

  @observable
  RelativesModel relatives =
      RelativesModel(data: [], pagination: PaginationModel(page: 0, total: 0, pageSize: 0));

  init() async {
    loadData(page: 0);
  }

  @action
  loadData({required int page}) async {
    var relativesResponse = await RelativesService().getRelatives(page: page, searchData: searchData);
    if (relativesResponse != null) {
      relatives = relativesResponse;
    }
  }

  @action
  setSearch(String search){
    searchData.search = search;
    loadData(page: 0);
  }

  @action
  resetSearch() {
    searchData.search = '';
    loadData(page: 0);
  }

  @action
  loadMore() async {
    var relativesResponse = await loadData(page: relatives.pagination.page + 1);
    if (relativesResponse != null) {
      relatives.data.addAll(relativesResponse.data);
      relatives.pagination = relativesResponse.pagination;
    }
  }

  @computed
  bool get canLoadMore => relatives.data.length < relatives.pagination.total;
}
