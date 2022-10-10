import 'package:familia_flutter/components/widgets/removeSuffix.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget(
      {Key? key,
      required this.controller,
      required this.onChanged,
      this.labelText,
      this.maxLines,
      this.minLines,
      this.hintText,
      this.isNoBorder = false,
      this.validator,
      })
      : super(key: key);

  TextEditingController controller;
  Function(String) onChanged;
  String? labelText;
  int? maxLines;
  int? minLines;
  String? hintText;
  bool isNoBorder;
  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        maxLines: maxLines,
        minLines: minLines,
        onChanged: onChanged,
        validator: validator,
        decoration: InputDecoration(
            border: isNoBorder ? InputBorder.none : null,
            hintText: hintText,
            labelText: labelText,
            alignLabelWithHint: true,
            suffixIcon: controller.text.isNotEmpty
                ? getRemoveSuffix(onPressed: () {
                    controller.clear();
                    onChanged('');
                  })
                : null));
  }
}
