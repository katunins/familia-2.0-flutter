import 'package:familia_flutter/components/tree/horizontal_tree_branch_line.dart';
import 'package:familia_flutter/components/tree/tree_element.dart';
import 'package:familia_flutter/models/tree_element.dart';
import 'package:familia_flutter/stores/tree.store.dart';
import 'package:flutter/cupertino.dart';

import '../../themes/sizes.dart';


/// rootUser - главный пользователь;
/// elements - пользователи горизонтальной ветки (братья и сестры);
/// alignment - расположение горизонтальной ветки
///  - center гланвый пользователь по центру, а остальные распределяются слева и справа
///     + ставится прозрачный блок для выравнивания;
///  centerLeft / centerRight - центральный пользователь прижат слева или справа,
///     а остальные отходят от него в сторону

class TreeHorizontalBuilder extends StatelessWidget {
  const TreeHorizontalBuilder(
      {Key? key, required this.rootUser, required this.elements, required this.alignment})
      : super(key: key);

  final TreeElementModel rootUser;
  final List<TreeElementModel> elements;
  final CrossAxisAlignment alignment;

  int get _indexIncrease => alignment == CrossAxisAlignment.center ? 2 : 1;

  List<Widget> get leftChildren {
    var res = <Widget>[];
    if (alignment == CrossAxisAlignment.start) {
      return res;
    }

    for (var index = elements.length - 1; index >= 0; index -= _indexIncrease) {
      res.add(TreeElement(user: elements[index]));
      if (index < elements.length) {
        res.add(const HorizontalTreeBranch());
      }
    }
    return res;
  }

  List<Widget> get rightChildren {
    var res = <Widget>[];
    var startIndex = alignment == CrossAxisAlignment.center ? 1 : 0;
    if (alignment == CrossAxisAlignment.end) {
      return res;
    }
    for (var index = startIndex; index < elements.length; index += _indexIncrease) {
      if (index < elements.length) {
        res.add(const HorizontalTreeBranch());
      }
      res.add(TreeElement(user: elements[index]));
    }
    //при нечетном количестве элементов правая ветка всегда меньше первой
    //добавим прозрачный элемент для симметрии
    if (alignment == CrossAxisAlignment.center && !elements.length.isEven) {
      res.add(SizedBox(width: treeStore.itemBlockWidth + AppSizes.minBranchLineSize + treeStore.paddingBetween * 2));
    }
    return res; //alignment == Alignment.centerLeft ? res : res.reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [...leftChildren, TreeElement(user: rootUser), ...rightChildren],
    );
  }
}
