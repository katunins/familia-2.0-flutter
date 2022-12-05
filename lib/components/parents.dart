import 'package:familia_flutter/components/relativesLineBlock.dart';
import 'package:familia_flutter/models/treeElement.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/relative.model.dart';
import '../themes/colors.dart';
import '../themes/text.theme.dart';

class Parents extends StatelessWidget {
  const Parents(
      {Key? key, required this.elements, this.onPressed, this.editMode = false})
      : super(key: key);

  final List<TreeElementModel> elements;
  final Function(String userId)? onPressed;
  final bool editMode;

  getDecoration() {
    if (editMode) {
      return BoxDecoration(
          border: Border.all(color: AppColors.greyColor),
          borderRadius: BorderRadius.circular(10));
    }

    return BoxDecoration(
        color: AppColors.secondaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10));
  }

  @override
  Widget build(BuildContext context) {

    return Container(
        width: double.infinity,
        decoration: getDecoration(),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        margin: const EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            Text(
              'Родители',
              style: headlineStyle,
            ),
            const SizedBox(height: 10),
            RelativesLineBlock(
              elements: elements,
              onPressed: onPressed,
            )
          ],
        ));
  }
}
