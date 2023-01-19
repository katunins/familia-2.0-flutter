import 'package:familia_flutter/helpers/family_ties.dart';
import 'package:familia_flutter/models/tree_element.dart';
import 'package:familia_flutter/stores/relatives.store.dart';
import 'package:familia_flutter/themes/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import '../helpers/util.helper.dart';
import '../main.dart';

part 'tree.store.g.dart';

var treeStore = TreeStore();

class TreeStore = TreeStoreBase with _$TreeStore;

abstract class TreeStoreBase with Store {

  @observable
  bool readyToPaintBranches = false;

  @observable
  // TreeElementModel rootUser = userStore.user!.toTreeElement();
  TreeElementModel rootUser = relativesStore.relatives.firstWhere((element) => element.id == '6283827e06f77c001d761877').toTreeElement();

  @action
  // выравнивает компоненты из elementElements, которые не по центру
  // после если все ровны - включает отрисовку веток
  setOneColumnElementsShift() {
    for (var item in elementElements.entries) {
      double shift =getTreeElementsShift(item.key, item.value);
      if (shift != 0) {
        if (shift < 0) {
          elementEdgeInsets[item.key] = EdgeInsets.only(right: -shift * 2);
        } else {
          elementEdgeInsets[item.key] = EdgeInsets.only(left: shift * 2);
        }
      }
      if (shift == 0){
       setReadyToPaintBranches();
      }
    }
  }


  // TODO вынести в хелперы
  double getTreeElementsShift(String rootUser, List<String> nextUsers) {
    GlobalKey? rootKey = elementKeys[rootUser];
    GlobalKey? leftKey = elementKeys[nextUsers.first];
    GlobalKey? rightKey = elementKeys[nextUsers.last];

    if (leftKey == null || rightKey == null || rootKey == null) {
      throw FormatException('Ошибка построения древа');
    }

    double xRootCenter = getCenterElementXPosition(containerKey: globalKey, childKey: rootKey);

    double leftElementCenter = getCenterElementXPosition(containerKey: globalKey, childKey: leftKey);
    double rightElementCenter = getCenterElementXPosition(containerKey: globalKey, childKey: rightKey);

    double branchWidth = rightElementCenter - leftElementCenter;
    double branchCenter = leftElementCenter + branchWidth / 2;

    // то, насколько вправо сдвинут центр ветки относительно пользователя
    double shift = branchCenter - xRootCenter;
    return shift;
  }

  @observable
  double zoom = 1;

  // карта ключей элементров древа id - ключ
  Map<String, GlobalKey> elementKeys = {};

  // карта элементов с их ответвлениями
  @observable
  Map<String, List<String>> elementElements = {};

  // карта элементов с их отступами
  @observable
  Map<String, EdgeInsets> elementEdgeInsets = ObservableMap<String, EdgeInsets>.of({});

  @computed
  double get userPicSize => AppSizes.userPicSize * zoom;

  @computed
  double get treeElementHeight => 133 * zoom;

  @computed
  double get paddingBetween => 10 * zoom;

  @computed
  double get itemBlockWidth => userPicSize + paddingBetween * 2;

  @computed
  FamilyTies get rootFamilyTies => FamilyTies(rootUser: rootUser);

  List<RenderBox> getRenderBoxes(List<String> idList) {
    return idList.map((id) {
      GlobalKey? globalKey = elementKeys[id];
      if (globalKey == null) {
        throw const FormatException('Ошибка рендера древа - context');
      }
      var context = globalKey.currentContext;
      if (context == null) {
        throw const FormatException('Ошибка рендера древа - context');
      }
      var renderBox = getRenderFromContext(context);
      if (renderBox == null) {
        throw const FormatException('Ошибка рендера древа - renderBox');
      }
      return renderBox;
    }).toList();
  }

  @action
  setReadyToPaintBranches(){
    readyToPaintBranches = true;
  }

  @action
  setElementElements({required String userId, required List<String> elements}) {
    elementElements[userId] = elements;
  }

  @action
  setElementKey({required String userId, required GlobalKey globalKey}) {
    elementKeys[userId] = globalKey;
  }

  @action
  setRootUser(TreeElementModel user) {
    // print(user.id);
    rootUser = user;
  }

  @action
  setUserPicSize(double val) => zoom = val;
}
