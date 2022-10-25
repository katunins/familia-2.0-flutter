import 'package:familia_flutter/models/gender.enum.dart';
import 'package:familia_flutter/models/relative.model.dart';
import 'package:familia_flutter/models/user.model.dart';
import 'package:mobx/mobx.dart';

import 'relatives.store.dart';

part 'familyTires.store.g.dart';

var familyTires = FamilyTiresStore();

class FamilyTiresStore = FamilyTiresBase with _$FamilyTiresStore;

abstract class FamilyTiresBase with Store {

  init(UserModel user){
    rootUser = user;
    _getChildren();
    _getGrandsons();
    _getSisterBrothers();
    _getGrandParents();
    _getGreatGrandParents();
    _getGreatGreatGrandParents();
  }

  UserModel? rootUser;

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
    var parents = rootUser?.userData?.parents;
    if (parents?.father != null && parents!.father == rootUser?.userData.parents?.father) {
      return 'Отец';
    }
    if (parents?.mother != null && parents!.mother == rootUser?.userData.parents?.mother) {
      return 'Мать';
    }
    return null;
  }

  @action
  _getChildren() {
    relativesStore.relatives.map((element) {
      var parents = element.data.userData.parents;
      if (parents?.mother == rootUser?.id || parents?.father == rootUser?.id) {
        children.add(element.data.id);
      }
    }).toList();
  }

  @action
  _getGrandsons() {
    children.map((item) {
      relativesStore.relatives.map((element) {
        var parents = element.data.userData.parents;
        if (parents?.mother == item || parents?.father == item) {
          children.add(element.data.id);
        }
      });
    }).toList();
  }

  @action
  _getSisterBrothers() {
    relativesStore.relatives.map((element) {
      var parents = element.data.userData.parents;
      if ((parents?.father != null &&
              parents!.father == rootUser?.userData.parents?.father) ||
          (parents?.mother != null &&
              parents!.mother == rootUser?.userData.parents?.mother)) {
        sisterBrothers.add(element.data.id);
      }
    }).toList();
  }

  @action
  _getGrandParents() {
    var parents = rootUser?.userData.parents;
    [parents?.father, parents?.mother].map((element) {
      if (element == null) {
        return;
      }
      var parent = relativesStore.getRelativeById(element);
      if (parent == null) {
        return;
      }
      if (parent?.userData.parents?.mother != null) {
        grandParents.add(parent!.userData.parents!.mother!);
      }
      if (parent?.userData.parents?.father != null) {
        grandParents.add(parent!.userData.parents!.father!);
      }
    }).toList();
  }

  @action
  _getGreatGrandParents() {
    grandParents.map((element) {
      var parent = relativesStore.getRelativeById(element);
      if (parent == null) {
        return;
      }
      if (parent?.userData.parents?.mother != null) {
        greatGrandParents.add(parent!.userData.parents!.mother!);
      }
      if (parent?.userData.parents?.father != null) {
        greatGrandParents.add(parent!.userData.parents!.father!);
      }
    }).toList();
  }

  @action
  _getGreatGreatGrandParents() {
    greatGrandParents.map((element) {
      var parent = relativesStore.getRelativeById(element);
      if (parent == null) {
        return;
      }
      if (parent?.userData.parents?.mother != null) {
        greatGreatGrandParents.add(parent!.userData.parents!.mother!);
      }
      if (parent?.userData.parents?.father != null) {
        greatGreatGrandParents.add(parent!.userData.parents!.father!);
      }
    }).toList();
  }
}
