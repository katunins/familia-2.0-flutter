import 'package:familia_flutter/models/tree_element.dart';
import 'package:familia_flutter/stores/user.store.dart';
import 'package:familia_flutter/themes/sizes.dart';
import 'package:mobx/mobx.dart';

part 'tree.store.g.dart';

var treeStore = TreeStore();

class TreeStore = TreeStoreBase with _$TreeStore;

abstract class TreeStoreBase with Store {
  @observable
  TreeElementModel rootUser = userStore.user!.toTreeElement();

  @observable
  double zoom = 1;

  @computed
  double get userPicSize => AppSizes.userPicSize * zoom;

  double get paddingBetween => 5 * zoom;

  double get itemBlockWidth => userPicSize + paddingBetween*2;

  double get itemFontSize => 14 * zoom;

  @action
  setRootUser(TreeElementModel user) => rootUser = user;

  @action
  setUserPicSize(double val) => zoom = val;
}
