import 'package:familia_flutter/helpers/util.helper.dart';

import '../models/gender.enum.dart';
import '../models/tree_element.dart';

class FamilyTies {
  FamilyTies({required this.rootUser});

  final TreeElementModel rootUser;

  final List<TreeElementModel> _allUsers = getAllUsers();

  String? getType(TreeElementModel user) {
    Map<Gender, String> result = {};

    if (children.contains(user)) {
      result = {
        Gender.male: 'Сын',
        Gender.female: 'Дочь',
        Gender.none: 'Дети',
      };
    }
    if (grandSons.contains(user)) {
      result = {
        Gender.male: 'Внук',
        Gender.female: 'Внучка',
        Gender.none: 'Внуки',
      };
    }
    if (sisterBrothers.contains(user)) {
      result = {
        Gender.male: 'Брат',
        Gender.female: 'Сестра',
        Gender.none: 'Братья и сестры',
      };
    }
    if (grandParents.contains(user)) {
      result = {
        Gender.male: 'Дед',
        Gender.female: 'Бабушка',
        Gender.none: 'Дедушки и бабушки',
      };
    }
    if (greatGrandParents.contains(user)) {
      result = {
        Gender.male: 'Прадед',
        Gender.female: 'Прабабушка',
        Gender.none: 'Прабабушки и прадедушки',
      };
    }
    if (greatGreatGrandParents.contains(user)) {
      result = {
        Gender.male: 'Прапрадед',
        Gender.female: 'Прапрабабушка',
        Gender.none: 'Прапрабабушки и прапрадедушки',
      };
    }

    if (spouses.contains(user)) {
      result = {
        Gender.male: 'Супруг',
        Gender.female: 'Супруга',
        Gender.none: 'Супруги',
      };
    }

    if (rootUser.parents.toTreeElements().contains(user)) {
      result = {
        Gender.male: 'Отец',
        Gender.female: 'Мать',
        Gender.none: 'Родители',
      };
    }

    return result[user.gender];
  }

  List<String> _getIdList(List<TreeElementModel> list) => list.map((e) => e.id).toList();

  List<TreeElementModel> _getChildren(TreeElementModel user) =>
      _allUsers.where((el) => el.parents.contains(user.id)).toList();

  List<TreeElementModel> get children => _allUsers.fold(<TreeElementModel>[],
      (previousValue, user) => user.parents.contains(rootUser.id) ? [...previousValue, user] : previousValue);

  List<TreeElementModel> get grandSons => _allUsers.fold(
      <TreeElementModel>[],
      (previousValue, user) => searchListInList(_getIdList(children), user.parents.toList())
          ? [...previousValue, user]
          : previousValue);

  List<TreeElementModel> get sisterBrothers => _allUsers.fold(
      <TreeElementModel>[],
      (previousValue, user) =>
          user.parents.toList().contains(rootUser.id) ? [...previousValue, user] : previousValue);

  List<TreeElementModel> get grandParents => _allUsers.fold(
      <TreeElementModel>[],
      (previousValue, user) => searchListInList(rootUser.parents.toList(), _getIdList(_getChildren(user)))
          ? [...previousValue, user]
          : previousValue);

  List<TreeElementModel> get greatGrandParents => _allUsers.fold(
      <TreeElementModel>[],
      (previousValue, user) =>
          searchListInList(grandParents, _getChildren(user)) ? [...previousValue, user] : previousValue);

  List<TreeElementModel> get greatGreatGrandParents => _allUsers.fold(
      <TreeElementModel>[],
      (previousValue, user) =>
          searchListInList(greatGrandParents, _getChildren(user)) ? [...previousValue, user] : previousValue);

  List<TreeElementModel> get spouses => _allUsers.fold(
      <TreeElementModel>[],
      (previousValue, user) =>
          searchListInList(_getChildren(user), children) ? [...previousValue, user] : previousValue);
}
