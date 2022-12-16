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
  var _text = '';
  final controller = TextEditingController();

  @override
  void initState() {
    controller.text = widget.initialValue;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  setValue(String value) {
    setState(() => _text = value);
    widget.onChange(value);
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
      maxLines: 1,
      controller: controller,
      isMini: true,
      onChanged: setValue,
      hintText: 'Поиск',
    );
  }
}
