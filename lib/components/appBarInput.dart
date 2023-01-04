import 'package:familia_flutter/components/widgets/textFieldWidget.dart';
import 'package:familia_flutter/models/searchStoreBar.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarInput extends StatefulWidget {
  const AppBarInput({
    Key? key,
    required this.searchBarStore,
  }) : super(key: key);

  final SearchBarStoreModel searchBarStore;

  @override
  State<AppBarInput> createState() => _AppBarInputState();
}

class _AppBarInputState extends State<AppBarInput> {
  final controller = TextEditingController();

  @override
  void initState() {
    controller.text = widget.searchBarStore.search;
    controller.addListener(() {
      widget.searchBarStore.setSearch(controller.text);
      setState(() {

      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
      maxLines: 1,
      isMini: true,
      controller: controller,
      hintText: 'Поиск',
    );
  }
}
