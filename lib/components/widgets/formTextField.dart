import 'package:familia_flutter/components/widgets/removeSuffix.dart';
import 'package:flutter/material.dart';

getTextFormField({
  required TextEditingController controller,
  required Function updateCanSubmit,
  required String labelText,
  int? maxLines,
  int? minLines,
  String? hintText,
}) =>
    TextFormField(
        controller: controller,
        maxLines: maxLines,
        minLines: minLines,
        decoration: InputDecoration(
            hintText: hintText,
            labelText: labelText,
            alignLabelWithHint: true,
            suffixIcon: getRemoveSuffix(
                onPressed: () {
                  controller.clear();
                  updateCanSubmit();
                },
                textEditingController: controller)),
        onChanged: (value) {
          updateCanSubmit();
        });
