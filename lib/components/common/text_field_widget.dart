import 'package:flutter/material.dart';

import '../widgets/remove_suffix.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
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

  final TextEditingController controller;
  final String? labelText;
  final int? maxLines;
  final int? minLines;
  final String? hintText;
  final bool isMini;
  final String? errorText;
  final String? Function(String?)? validator;

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
                ? const EdgeInsets.symmetric(vertical: 8, horizontal: 16)
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
