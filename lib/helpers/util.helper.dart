import 'package:familia_flutter/config.dart';
import 'package:familia_flutter/models/parents.model.dart';
import 'package:familia_flutter/models/tree_element.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

String? getImageUrl(String? imageUrl) {
  if (imageUrl == null) return null;
  return Config.baseApiOptions.baseUrl + imageUrl;
}

getOriginalImageUrl(String? imageUrl) {
  if (imageUrl == null) return null;
  return imageUrl.substring(Config.baseApiOptions.baseUrl.length);
}

getBearerToken() {
  var accessToken = GetIt.I<SharedPreferences>().getString('access-token');
  return 'Bearer $accessToken';
}

Gender getGenderFromJson(String? value) {
  switch (value) {
    case 'male':
      return Gender.male;

    case 'female':
      return Gender.female;

    default:
      return Gender.none;
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
    var treeElement = getFromAllFamily(id);
    if (treeElement == null) {
      Exception(['02 -Не найден пользователь $id']);
    }
    return treeElement!;
  }).toList();
}

/// Возвращает список treeElements для двух родителей
/// Если родителей меньше двух, то добавляет treeElement.empty
List<TreeElementModel> getParentElements(ParentsModel? parents,
    {parentsCount = 2}) {
  List<TreeElementModel> result = [];
  if (parents != null) {
    for (var id in parents.toIdsList()) {
      var treeElement = getFromAllFamily(id);
      if (treeElement == null) {
        Exception(['04 - Не найден пользователь $id']);
      }
      result.add(treeElement!);
    }
  }
  while (result.length < parentsCount) {
    result.add(TreeElementModel.empty());
  }
  return result;
}

/// сравнивает id двух родителей
/// если они одинаковые, то возвращает true
bool isSameParentsModels(ParentsModel parent1, ParentsModel parent2) {
  if (parent1.father != parent2.father) {
    return false;
  }
  if (parent1.mother != parent2.mother) {
    return false;
  }
  return true;
}

/// Возвращает список TreeElements пользователя и родственников в системе,
/// excluded - список id, которые нужно исключить из списка
List<TreeElementModel> getAllUsers({List<String>? excluded}) {
  excluded ??= [];

  List<TreeElementModel> res = [];

  if (excluded.firstWhere((id) => userStore.user?.id == id, orElse: () => '') ==
      '') {
    res.add(userStore.user!.toTreeElement());
  }
  var filterRelatives = relativesStore.relatives.where((element) =>
      excluded!.firstWhere((id) => element.data.id == id, orElse: () => '') ==
      '');
  res.addAll(filterRelatives.map((item) => item.data.toTreeElement()));
  return res;
}

TreeElementModel? getFromAllFamily(String id) {
  return getAllUsers().firstWhere((element) => element.id == id);
}

/// Принимает список ID пользователей
/// Возвращает список userPic, которые не null
List<String> getUserPicsList(List<String> userIds) {
  List<String> res = [];
  for (var id in userIds) {
    var user = getFromAllFamily(id);
    if (user?.userPic != null) {
      res.add(user!.userPic!);
    }
  }
  return res;
}

void showSnackBar(String message) {
  var currentState = GetIt.I<GlobalKey<ScaffoldMessengerState>>().currentState;
  currentState?.showSnackBar(SnackBar(content: Text(message)));
}
