import 'package:familia_flutter/components/widgets/removeSuffix.dart';
import 'package:familia_flutter/components/widgets/textFieldWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarSearchInput extends StatefulWidget {
  const AppBarSearchInput(
      {Key? key, required this.initialValue, required this.onChange})
      : super(key: key);

  final String initialValue;
  final void Function(String) onChange;

  @override
  State<AppBarSearchInput> createState() => _AppBarSearchInputState();
}

class _AppBarSearchInputState extends State<AppBarSearchInput> {
  var _text = '';
  final controller = TextEditingController();

  @override
  void initState() {
    controller.text = widget.initialValue;
    super.initState();
  }

  setValue(String value) {
    setState(() => _text = value);
    widget.onChange(value);
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
        controller: controller,
        isMini: true,
        onChanged: setValue,
        hintText: 'Поиск',
    );
  }
}
