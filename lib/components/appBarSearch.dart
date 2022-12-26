import 'package:familia_flutter/components/widgets/removeSuffix.dart';
import 'package:familia_flutter/components/widgets/textFieldWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchInput extends StatefulWidget {
  const SearchInput(
      {Key? key,
      required this.initialValue,
      required this.onChange})
      : super(key: key);

  final String initialValue;
  final void Function(String) onChange;

  @override
  State<SearchInput> createState() => _AppBarSearchInputState();
}

class _AppBarSearchInputState extends State<SearchInput> {
  final controller = TextEditingController();

  @override
  void initState() {
    controller.text = widget.initialValue;
    controller.addListener(() {
      widget.onChange(controller.text);
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.clear();
    super.dispose();
  }

  setValue(String value) {
    widget.onChange(value);
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
