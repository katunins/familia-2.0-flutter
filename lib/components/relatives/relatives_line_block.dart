import 'package:familia_flutter/components/relatives/user_item_description.dart';
import 'package:familia_flutter/components/tree/branch_builder.dart';
import 'package:familia_flutter/helpers/util.helper.dart';
import 'package:familia_flutter/models/tree_element.dart';
import 'package:familia_flutter/themes/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Компонент пользователей в одной линии с элементами древа
/// elements - список элементов
/// onPressed - callBack, вызывающийся при клике на элемент
/// emptyTitle - если в списке элементов есть элемент с type == empty,
/// то в линии рендерится Empty компонент, в котором будет подпись emptyTitle

class RelativesLineBlock extends StatefulWidget {
  RelativesLineBlock({super.key, required this.elements, this.onPressed, this.emptyTitle});

  final List<TreeElementModel> elements;
  final Function(String userId)? onPressed;
  final String? emptyTitle;
  final Map<String, GlobalKey> parentsElementsKeys = {}; // храниличе GlobalKey элементов списка
  final GlobalKey _containerKey = GlobalKey();

  @override
  State<RelativesLineBlock> createState() => _RelativesLineBlockState();
}

class _RelativesLineBlockState extends State<RelativesLineBlock> {
  bool buildIsReady = false; // список элементов выведен, можно рисовать линии
  RenderBox? containerRenderBox;
  List<RenderBox> elementsRenderBoxes = [];

  // Записывает создает в объекте elementsRenderBoxes
  // значения RenderBox для каждого элемента по id GlobalKey
  void getElementsRenderBoxes() {
    for (var globalKeys in widget.parentsElementsKeys.entries) {
      var renderBox = getRenderBox(globalKeys.value);
      if (renderBox != null) {
        elementsRenderBoxes.add(renderBox);
      }
    }
  }

  @override
  void initState() {
    // Заполняет parentsElementsKeys ключами GlobalKey
    for (var element in widget.elements) {
      if (widget.parentsElementsKeys[element.id] == null) {
        widget.parentsElementsKeys[element.id] = GlobalKey();
      }
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      getElementsRenderBoxes();
      containerRenderBox = getRenderFromContext(context);
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(key: widget._containerKey, children: [
      if (containerRenderBox != null)
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          child: BranchBuilder(
            elementsRenderBoxes: elementsRenderBoxes,
            verticalDirection: AxisDirection.down,
            alignment: CrossAxisAlignment.center,
          ),
        ),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: widget.elements
              .map(
                (item) => item.type == TreeElementTypes.empty
                    ? UserItemWithDescription(
                        horizontalPadding: AppSizes.marginHorizontal,
                        title: widget.emptyTitle,
                        key: widget.parentsElementsKeys[item.id],
                        onPressed: widget.onPressed,
                      )
                    : UserItemWithDescription(
                        horizontalPadding: AppSizes.marginHorizontal,
                        user: item,
                        key: widget.parentsElementsKeys[item.id],
                        onPressed: widget.onPressed,
                      ),
              )
              .toList()),
    ]);
  }
}
