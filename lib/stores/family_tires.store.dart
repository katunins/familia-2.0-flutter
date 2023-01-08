import 'package:familia_flutter/helpers/util.helper.dart';
import 'package:familia_flutter/models/gender.enum.dart';
import 'package:familia_flutter/models/relative.model.dart';
import 'package:familia_flutter/models/tree_element.dart';
import 'package:familia_flutter/models/user.model.dart';
import 'package:familia_flutter/stores/user.store.dart';
import 'package:mobx/mobx.dart';

part 'family_tires.store.g.dart';

var familyTires = FamilyTreesStore(userStore.user!.toTreeElement());

class FamilyTreesStore = FamilyTreesBase with _$FamilyTreesStore;

abstract class FamilyTreesBase with Store {

  FamilyTreesBase(this.rootUser){
    init(rootUser);
  }

  init(TreeElementModel user) {
    rootUser = user;
    _getChildren();
    _getGrandsons();
    _getSisterBrothers();
    _getGrandParents();
    _getGreatGrandParents();
    _getGreatGreatGrandParents();
    _getSpouses();
  }

  @observable
  TreeElementModel rootUser;

  @observable
  List<String> children = [];

  @observable
  List<String> grandsons = [];

  @observable
  List<String> sisterBrothers = [];

  @observable
  List<String> grandParents = [];

  @observable
  List<String> greatGrandParents = [];

  @observable
  List<String> greatGreatGrandParents = [];

  @observable
  List<String> spouses = [];

  String? getType(RelativeModel relative) {
    if (children.contains(relative.id)) {
      switch (relative.userData.gender) {
        case Gender.male:
          return 'Сын';
        case Gender.female:
          return 'Дочь';
        default:
          return 'Дети';
      }
    }
    if (grandsons.contains(relative.id)) {
      switch (relative.userData.gender) {
        case Gender.male:
          return 'Внук';
        case Gender.female:
          return 'Внучка';
        default:
          return 'Внуки';
      }
    }
    if (sisterBrothers.contains(relative.id)) {
      switch (relative.userData.gender) {
        case Gender.male:
          return 'Брат';
        case Gender.female:
          return 'Сестра';
        default:
          return 'Братья и сестры';
      }
    }
    if (grandParents.contains(relative.id)) {
      switch (relative.userData.gender) {
        case Gender.male:
          return 'Дед';
        case Gender.female:
          return 'Бабка';
        default:
          return 'Бабушки и дедушки';
      }
    }
    if (greatGrandParents.contains(relative.id)) {
      switch (relative.userData.gender) {
        case Gender.male:
          return 'Прадед';
        case Gender.female:
          return 'Прабабка';
        default:
          return 'Прабабушки и прадедушки';
      }
    }
    if (greatGreatGrandParents.contains(relative.id)) {
      switch (relative.userData.gender) {
        case Gender.male:
          return 'Прапрадед';
        case Gender.female:
          return 'Прапрабабка';
        default:
          return 'Прарабабушки и прапрадедушки';
      }
    }
    var parents = rootUser?.parents;
    if (parents?.father == relative.id) {
      return 'Отец';
    }
    if (parents?.mother == relative.id) {
      return 'Мать';
    }
    if (spouses.contains(relative.id)) {
      return relative.userData.gender == Gender.male ? 'Супруг' : 'Супруга';
    }
    return null;
  }

  @action
  _getChildren() {
    getAllUsers().map((element) {
      var parents = element.parents;
      if (parents.mother == rootUser?.id || parents.father == rootUser?.id) {
        children.add(element.id);
      }
    }).toList();
  }

  @action
  _getGrandsons() {
    children.map((item) {
      getAllUsers().map((element) {
        var parents = element.parents;
        if (parents.mother == item || parents.father == item) {
          children.add(element.id);
        }
      });
    }).toList();
  }

  @action
  _getSisterBrothers() {
    getAllUsers().map((element) {
      var parents = element.parents;
      if ((parents.father != '' &&
              parents.father == rootUser?.parents.father) ||
          (parents.mother != '' &&
              parents.mother == rootUser?.parents.mother)) {
        sisterBrothers.add(element.id);
      }
    }).toList();
  }

  @action
  _getGrandParents() {
    if (rootUser == null) {
      return;
    }
    var parents = rootUser!.parents;
    parents.toIdsList().where((id) => id.isNotEmpty).map((id) {
      var parent = getFromAllFamily(id);
      if (parent != null) {
        if (parent.parents.mother != '') {
          grandParents.add(parent.parents.mother);
        }
        if (parent.parents.father != '') {
          grandParents.add(parent.parents.father);
        }
      } else {
        Exception(['01 - Не найден пользователь $id']);
      }
    }).toList();
  }

  @action
  _getGreatGrandParents() {
    grandParents.map((id) {
      var parent = getFromAllFamily(id);
      if (parent == null) {
        return;
      }
      if (parent.parents.mother != '') {
        greatGrandParents.add(parent.parents.mother);
      }
      if (parent.parents.father != '') {
        greatGrandParents.add(parent.parents.father);
      }
    }).toList();
  }

  @action
  _getGreatGreatGrandParents() {
    greatGrandParents.map((id) {
      var parent = getFromAllFamily(id);
      if (parent == null) {
        return;
      }
      if (parent.parents.mother != '') {
        greatGreatGrandParents.add(parent.parents.mother);
      }
      if (parent.parents.father != '') {
        greatGreatGrandParents.add(parent.parents.father);
      }
    }).toList();
  }

  @action
  _getSpouses() {
    if (rootUser == null) {
      return;
    }
    for (var id in children) {
      var child = getFromAllFamily(id);
      if (child == null) {
        return;
      }
      for (var parentId in child.parents.toIdsList()) {
        if (parentId != rootUser!.id) {
          spouses.add(parentId);
        }
      }
    }
  }
}
