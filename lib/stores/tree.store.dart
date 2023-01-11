import 'package:familia_flutter/helpers/family_ties.dart';
import 'package:familia_flutter/models/tree_element.dart';
import 'package:familia_flutter/stores/relatives.store.dart';
import 'package:familia_flutter/themes/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import '../helpers/util.helper.dart';

part 'tree.store.g.dart';

var treeStore = TreeStore();

class TreeStore = TreeStoreBase with _$TreeStore;

abstract class TreeStoreBase with Store {
  @observable
  // TreeElementModel rootUser = userStore.user!.toTreeElement();
  TreeElementModel rootUser = relativesStore.relatives.firstWhere((element) => element.id == '6283827e06f77c001d761877').toTreeElement();


  // 6283827e06f77c001d761877 - прадед

  @observable
  double zoom = 1;

  Map<String, GlobalKey> elementKeys = {};

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
