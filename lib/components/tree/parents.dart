import 'package:familia_flutter/models/parents.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../themes/colors.dart';
import '../../../themes/text.theme.dart';
import '../relatives/relatives_line_block.dart';

/// Блок двух родителей с линиями ветвей
/// parents - объект родителей
/// onPressed (userId) - callBack в который передается userId пользователя, на который нажали или "", если пользователь был empty
/// emptyTitle - подпись для empty - родителя

class Parents extends StatelessWidget {
  const Parents(
      {Key? key,
      required this.parents,
      this.onPressed,
      required this.emptyTitle,
      this.decoration})
      : super(key: key);

  final ParentsModel? parents;
  final Function(String userId)? onPressed;
  final String emptyTitle;
  final Decoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: decoration ??
            BoxDecoration(
                border: Border.all(color: AppColors.greyColor),
                borderRadius: BorderRadius.circular(10)),
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
              emptyTitle: emptyTitle,
              key: GlobalKey(),
              elements: parents?.toTreeElements() ?? [],
              onPressed: onPressed,
            )
          ],
        ));
  }
}
