import 'package:auto_route/auto_route.dart';
import 'package:familia_flutter/components/common/button.dart';
import 'package:familia_flutter/components/relatives/relatives_list_sheet_component.dart';
import 'package:familia_flutter/components/widgets/checkbox.dart';
import 'package:familia_flutter/helpers/util.helper.dart';
import 'package:flutter/cupertino.dart';

import '../../models/tree_element.dart';

/// Bottom Sheet со списком всех пользователей,
/// которые можно выбрать

class RelativesSelectorListSheet extends StatefulWidget {
  const RelativesSelectorListSheet(
      {Key? key, required this.onSaveSelected, required this.initialSelected})
      : super(key: key);

  final Function(List<String>) onSaveSelected;
  final List<String> initialSelected;

  @override
  State<RelativesSelectorListSheet> createState() =>
      _RelativesSelectorListSheetState();
}

class _RelativesSelectorListSheetState
    extends State<RelativesSelectorListSheet> {
  var selected = <String, bool>{};

  final List<TreeElementModel> relatives = getAllUsers();

  @override
  void initState() {
    initSelected();
    super.initState();
  }

  initSelected(){
    for (var id in widget.initialSelected) {
      selected[id] = true;
    }
    setState(() {});
  }

  onPressed() {
    var result = <String>[];
    selected.forEach((key, value) {
      if (value) {
        result.add(key);
      }
    });
    widget.onSaveSelected(result);
    context.router.pop();
  }

  @override
  Widget build(BuildContext context) {
    return RelativesListSheetComponent(
      relatives: relatives,
      onTapElement: (id) {
        selected[id] = selected[id] == null ? true : !selected[id]!;
        setState(() {});
      },
      getCheckBox: (String id) =>
          CheckBoxIcon(isChecked: selected[id] ?? false),
      button: AppButton(
        title: 'Выбрать',
        onPressed: onPressed,
        type: IAppButtonTypes.secondary,
      ),
    );
  }
}
