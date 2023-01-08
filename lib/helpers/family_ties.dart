import 'package:familia_flutter/helpers/util.helper.dart';

import '../models/gender.enum.dart';
import '../models/tree_element.dart';

class FamilyTies {
  FamilyTies({required this.rootUser});

  final TreeElementModel rootUser;

  final List<TreeElementModel> _allUsers = getAllUsers();

  String? getType(TreeElementModel user) {
    Map<Gender, String> result = {};

    if (_getIdList(children).contains(user.id)) {
      result = {
        Gender.male: 'Сын',
        Gender.female: 'Дочь',
        Gender.none: 'Дети',
      };
    }
    if (_getIdList(grandSons).contains(user.id)) {
      result = {
        Gender.male: 'Внук',
        Gender.female: 'Внучка',
        Gender.none: 'Внуки',
      };
    }
    if (_getIdList(sisterBrothers).contains(user.id)) {
      result = {
        Gender.male: 'Брат',
        Gender.female: 'Сестра',
        Gender.none: 'Братья и сестры',
      };
    }
    if (_getIdList(grandParents).contains(user.id)) {
      result = {
        Gender.male: 'Дед',
        Gender.female: 'Бабушка',
        Gender.none: 'Дедушки и бабушки',
      };
    }
    if (_getIdList(greatGrandParents).contains(user.id)) {
      result = {
        Gender.male: 'Прадед',
        Gender.female: 'Прабабушка',
        Gender.none: 'Прабабушки и прадедушки',
      };
    }
    if (_getIdList(greatGreatGrandParents).contains(user.id)) {
      result = {
        Gender.male: 'Прапрадед',
        Gender.female: 'Прапрабабушка',
        Gender.none: 'Прапрабабушки и прапрадедушки',
      };
    }

    if (_getIdList(spouses).contains(user.id)) {
      result = {
        Gender.male: 'Супруг',
        Gender.female: 'Супруга',
        Gender.none: 'Супруги',
      };
    }

    if (rootUser.parents.toList().contains(user.id)) {
      result = {
        Gender.male: 'Отец',
        Gender.female: 'Мать',
        Gender.none: 'Родители',
      };
    }

    if (_getIdList(parentsInLaw).contains(user.id)) {
      switch (rootUser.gender) {
        case Gender.male:
          result = {
            Gender.male: 'Тесть',
            Gender.female: 'Теща',
            Gender.none: 'Родители суруги',
          };
          break;
        case Gender.female:
          result = {
            Gender.male: 'Свекр',
            Gender.female: 'Свекровь',
            Gender.none: 'Родители суруга',
          };
          break;
        default:
          result = {
            Gender.male: 'Родители супругов',
            Gender.female: 'Родители супругов',
            Gender.none: 'Родители супругов',
          };
      }
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
      (previousValue, user) => searchListInList(user.parents.toList(), rootUser.parents.toList())
          ? [...previousValue, user]
          : previousValue);

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

  List<TreeElementModel> get parentsInLaw => spouses.fold(<TreeElementModel>[],
      (previousValue, spouse) => [...previousValue, ...spouse.parents.toTreeElements()]);
}
