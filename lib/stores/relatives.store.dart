import 'dart:developer';

import 'package:familia_flutter/config.dart';
import 'package:familia_flutter/models/pagination.model.dart';
import 'package:familia_flutter/models/relative.model.dart';
import 'package:familia_flutter/services/relatives.service.dart';
import 'package:familia_flutter/stores/relativeItem.store.dart';
import 'package:familia_flutter/stores/user.store.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

import '../models/baseUserData.model.dart';
import 'familyTires.store.dart';
import '../models/searchData.model.dart';
import '../services/storage.service.dart';

part 'relatives.store.g.dart';

var relativesStore = RelativesStore();

class RelativesStore = RelativesStoreBase with _$RelativesStore;

abstract class RelativesStoreBase with Store {
  var isLoading = false;

  // @observable
  // SearchDataModel searchData =
  //     SearchDataModel(search: '', fields: ['name', 'about']);

  @observable
  var relatives = ObservableList<RelativeItemStore>.of([]);

  // PaginationModel pagination =
  //     PaginationModel(page: 0, total: 0, pageSize: Config.pageSize);

  init() async {
    await loadData();
    familyTires.init(userStore.user!);
  }

  Future<bool> updateUserPic(
      {required XFile image, required String id}) async {
    var relative = getRelativeById(id);
    if (relative == null) {
      return false;
    }
    List<String> filesToDelete =
        relative.userData?.userPic != null ? [relative.userData!.userPic!] : [];
    var imageUrl = await StorageApi().uploadImage(
        image: image, pathType: 'relatives', filesToDelete: filesToDelete);
    if (imageUrl == null) {
      return false;
    }
    var newRelative = await RelativesService()
        .updateRelative(relativeId: id, dataObj: {'userPic': imageUrl});

    if (newRelative == null) {
      return false;
    }
    updateRelative(newRelative);
    return true;
  }

  Future<String?> updateUserData(
      {required BaseUserDataModel userData, required String relativeId}) async {
    Map<String, dynamic> dataObj = {};
    if (userData.name != null) dataObj['name'] = userData.name;
    if (userData.about != null) dataObj['about'] = userData.about;
    if (userData.gender != null) dataObj['gender'] = userData.gender!.name;
    var newRelative = await RelativesService()
        .updateRelative(relativeId: relativeId, dataObj: dataObj);
    if (newRelative != null) {
      updateRelative(newRelative);
    }
    return newRelative?.id ;
  }

  Future<String?> newUser(BaseUserDataModel userData) async {
    Map<String, dynamic> dataObj = {};
    if (userData.name != null) dataObj['name'] = userData.name;
    if (userData.about != null) dataObj['about'] = userData.about;
    if (userData.gender != null) dataObj['gender'] = userData.gender!.name;
    var newRelative = await RelativesService().createRelative(dataObj: dataObj);

    if (newRelative != null) {
      addRelative(newRelative);
    }

    return newRelative?.id;
  }

  updateRelative(RelativeModel relative) {
    var relativeItem =
        relatives.firstWhere((element) => element.data.id == relative.id);
    relativeItem.set(relative);
  }

  @action
  deleteRelative(String relativeId) async {
    var result = await RelativesService().deleteRelative(relativeId);
    if (result){
      relatives.removeWhere((element) => element.data.id == relativeId);
    }
    return result;
  }

  @action
  loadData({bool loadMore = false}) async {
    isLoading = true;
    // var page = pagination.page;
    // if (loadMore) {
    //   page ++;
    // }
    var json = await RelativesService().getRelatives();
    // var json = await RelativesService()
    //     .getRelatives(page: page, searchData: searchData);

    if (json != null) {
      var newData = json
          .map((item) => RelativeItemStore(RelativeModel.fromJson(item)))
          .toList();
      if (!loadMore) {
        relatives.clear();
      }
      relatives.addAll(newData);
      // pagination = PaginationModel.fromJson(json['pagination']);
    }
    isLoading = false;
  }

  @action
  addRelative(RelativeModel relative) {
    relatives.add(RelativeItemStore(relative));
  }

  // loadMore() async {
  //   await loadData(loadMore: true);
  // }

  // @action
  // setSearch(String search) {
  //   pagination.page = 0;
  //   searchData.search = search;
  //   loadData();
  // }

  // @action
  // resetSearch() {
  //   searchData.search = '';
  //   loadData();
  // }

  // @computed
  // bool get canLoadMore => !isLoading && relatives.length < pagination.total;

  RelativeModel? getRelativeById(relativeId) {
    if (relativeId == '') {
      return null;
    }
    return relatives
        .firstWhere((element) => element.data.id == relativeId)
        .data;
  }
}
