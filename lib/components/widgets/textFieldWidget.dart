import 'package:familia_flutter/components/widgets/removeSuffix.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({
    Key? key,
    required this.controller,
    this.labelText,
    this.maxLines,
    this.minLines,
    this.hintText,
    this.errorText,
    this.validator,
    this.isMini = false,
  }) : super(key: key);

  TextEditingController controller;
  String? labelText;
  int? maxLines;
  int? minLines;
  String? hintText;
  bool isMini;
  String? errorText;
  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: validator,
        controller: controller,
        maxLines: maxLines,
        minLines: minLines,
        decoration: InputDecoration(
            isDense: isMini ? true : null,
            errorText: errorText,
            contentPadding: isMini
                ? const EdgeInsets.symmetric(vertical: 10, horizontal: 16)
                : null,
            filled: isMini ? true : null,
            border: isMini ? InputBorder.none : null,
            hintText: hintText,
            labelText: labelText,
            alignLabelWithHint: true,
            suffixIcon: controller.text.isNotEmpty
                ? getRemoveSuffix(controller: controller)
                : null));
  }
}
