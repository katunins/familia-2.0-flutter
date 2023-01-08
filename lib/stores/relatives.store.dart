import 'package:familia_flutter/models/relative.model.dart';
import 'package:familia_flutter/services/relatives.service.dart';
import 'package:familia_flutter/stores/user.store.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

import '../helpers/family_ties.dart';
import '../models/base_user_data.model.dart';
import '../models/tree_element.dart';
import '../services/storage.service.dart';

part 'relatives.store.g.dart';

var relativesStore = RelativesStore();

class RelativesStore = RelativesStoreBase with _$RelativesStore;

abstract class RelativesStoreBase with Store {
  var isLoading = false;

  late FamilyTies _familyTies;

  String? getFamilyTies(TreeElementModel relative) => _familyTies.getType(relative);

  @observable
  var relatives = ObservableList<RelativeModel>.of([]);

  init() async {
    await loadData();
    _familyTies = FamilyTies(rootUser: userStore.user!.toTreeElement());
  }

  Future<bool> updateUserPic({required XFile image, required String id}) async {
    var relative = getRelativeById(id);
    List<String> filesToDelete =
        relative.userData.userPic != null ? [relative.userData.userPic!] : [];
    List? imageUrls = await StorageApi().uploadImages(
        images: [image], pathType: 'relatives', filesToDelete: filesToDelete);
    if (imageUrls == null) {
      return false;
    }
    var newRelative = await RelativesService()
        .updateRelative(relativeId: id, dataObj: {'userPic': imageUrls[0]});

    if (newRelative == null) {
      return false;
    }
    updateRelative(newRelative);
    return true;
  }

  @action
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
      relatives.add(newRelative);
    }

    return newRelative?.id;
  }

  updateRelative(RelativeModel relative) {
    int index = relatives.indexWhere((element) => element.id == relative.id);
    relatives[index] = relative;
  }

  @action
  deleteRelative(String relativeId) async {
    var result = await RelativesService().deleteRelative(relativeId);
    if (result) {
      relatives.removeWhere((element) => element.id == relativeId);
    }
    return result;
  }

  @action
  loadData({bool loadMore = false}) async {
    isLoading = true;
    List<RelativeModel>? newData = await RelativesService().getRelatives();
    if (newData != null) {
      if (!loadMore) {
        relatives.clear();
      }
      relatives.addAll(newData);
    }
    isLoading = false;
  }

  RelativeModel getRelativeById(relativeId) => relatives.firstWhere((element) => element.id == relativeId);
}
