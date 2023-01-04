import 'package:familia_flutter/components/common/text_field_widget.dart';
import 'package:familia_flutter/models/search_store_bar.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MiniSearchInput extends StatefulWidget {
  const MiniSearchInput({
    Key? key,
    required this.searchBarStore,
  }) : super(key: key);

  final SearchBarStoreModel searchBarStore;

  @override
  State<MiniSearchInput> createState() => _MiniSearchInputState();
}

class _MiniSearchInputState extends State<MiniSearchInput> {
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
