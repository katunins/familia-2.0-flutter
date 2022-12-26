import 'package:familia_flutter/models/relative.model.dart';
import 'package:familia_flutter/services/relatives.service.dart';
import 'package:familia_flutter/stores/relativeItem.store.dart';
import 'package:familia_flutter/stores/user.store.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

import '../models/baseUserData.model.dart';
import 'familyTires.store.dart';
import '../services/storage.service.dart';

part 'relatives.store.g.dart';

var relativesStore = RelativesStore();

class RelativesStore = RelativesStoreBase with _$RelativesStore;

abstract class RelativesStoreBase with Store {
  var isLoading = false;

  @observable
  var relatives = ObservableList<RelativeItemStore>.of([]);

  init() async {
    await loadData();
    familyTires.init(userStore.user!);
  }

  Future<bool> updateUserPic({required XFile image, required String id}) async {
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

    var newRelative = await RelativesService()
        .updateRelative(relativeId: relativeId, dataObj: userData.toMap());
    if (newRelative != null) {
      updateRelative(newRelative);
    }
    return newRelative?.id;
  }

  Future<String?> newUser(BaseUserDataModel userData) async {
    var newRelative = await RelativesService().createRelative(dataObj: userData.toMap());

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
    if (result) {
      relatives.removeWhere((element) => element.data.id == relativeId);
    }
    return result;
  }

  @action
  loadData({bool loadMore = false}) async {
    isLoading = true;
    var json = await RelativesService().getRelatives();

    if (json != null) {
      var newData = json
          .map((item) => RelativeItemStore(RelativeModel.fromJson(item)))
          .toList();
      if (!loadMore) {
        relatives.clear();
      }
      relatives.addAll(newData);
    }
    isLoading = false;
  }

  @action
  addRelative(RelativeModel relative) {
    relatives.add(RelativeItemStore(relative));
  }

  RelativeModel? getRelativeById(relativeId) => relatives
      .firstWhereOrNull((element) => element.data.id == relativeId)
      ?.data;
}
