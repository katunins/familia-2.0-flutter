import 'package:familia_flutter/components/relativesLineBlock.dart';
import 'package:familia_flutter/models/treeElement.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/relative.model.dart';
import '../themes/colors.dart';

class Parents extends StatelessWidget {
  const Parents({Key? key, required this.elements}) : super(key: key);

  final List<TreeElementModel> elements;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.secondaryColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        margin: const EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            Text(
              'Родители',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 10),
            RelativesLineBlock(
              elements: elements,
            )
          ],
        ));
  }
}
