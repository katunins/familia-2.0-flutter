import 'package:familia_flutter/config.dart';
import 'package:familia_flutter/models/parents.model.dart';
import 'package:familia_flutter/models/searchData.model.dart';
import 'package:familia_flutter/models/treeElement.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../main.dart';
import '../models/gender.enum.dart';
import '../stores/relatives.store.dart';
import '../stores/user.store.dart';

isEmailFormat(String? email) {
  if (email == null) {
    return false;
  }
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

getImageUrl(String? imageUrl) {
  if (imageUrl == null) return null;
  return Config.baseApiOptions.baseUrl + imageUrl;
}

getOriginalImageUrl(String? imageUrl) {
  if (imageUrl == null) return null;
  return imageUrl.substring(Config.baseApiOptions.baseUrl.length);
}

getBearerToken() {
  return 'Bearer ${localStorage.read('access-token')}';
}

getPaginationQueryParams(
        {required int page, required SearchDataModel searchData}) =>
    {
      'page': page.toString(),
      'pageSize': Config.pageSize.toString(),
      'searchData': searchData.toMap()
    };

getGenderFromJson(String? value) {
  switch (value) {
    case 'male':
      return Gender.male;

    case 'female':
      return Gender.female;

    default:
      return null;
  }
}

RenderBox? getRenderBox(GlobalKey globalKey) {
  if (globalKey.currentContext == null) {
    return null;
  }
  return globalKey.currentContext!.findRenderObject() as RenderBox;
}

RenderBox? getRenderFromContext(BuildContext context) {
  if (context.findRenderObject() == null) return null;
  return context.findRenderObject() as RenderBox;
}

List<TreeElementModel> getTreeElements(List<String> userIds) {
  return userIds.map<TreeElementModel>((id) {
    if (userStore.user != null && userStore.user!.id == id) {
      return userStore.user!.toTreeElement();
    }
    return relativesStore.getRelativeById(id)!.toTreeElement();
  }).toList();
}

/// Возвращает список treeElements для двух родителей
/// Если родителей меньше двух, то добавляет treeElement.empty
getParentElements(ParentsModel? parents, {parentsCount = 2}) {
  List<TreeElementModel> result = [];
  for (var relativeId in parents?.toIdsList() ?? []) {
    TreeElementModel? treeElement = relativeId == userStore.user!.id
        ? userStore.user!.toTreeElement()
        : relativesStore.getRelativeById(relativeId)?.toTreeElement();

    if (treeElement != null) {
      result.add(treeElement);
    }
  }
  while (result.length < parentsCount) {
    result.add(TreeElementModel.empty());
  }
  return result;
}

/// сравнивает id двух родителей
/// если они одинаковые, то возвращает true
bool isSameParentsModels(ParentsModel? parent1, ParentsModel? parent2) {
  var res = true;
  if (parent1?.father != parent2?.father) {
    res = false;
  }
  if (parent1?.mother != parent2?.mother) {
    res = false;
  }
  return res;
}

/// Возвращает список TreeElements пользователя и родственников в системе,
/// excluded - список id, которые нужно исключить из списка
List<TreeElementModel> getAllTreeElements(List<String> excluded) {
  List<TreeElementModel> res = [];
  if (excluded.firstWhereOrNull((id) => userStore.user!.id == id) == null) {
    res.add(userStore.user!.toTreeElement());
  }
  var filterRelatives = relativesStore.relatives.where((element) =>
      excluded.firstWhereOrNull((id) => element.data.id == id) == null);
  res.addAll(filterRelatives.map((item) => item.data.toTreeElement()));
  return res;
}
