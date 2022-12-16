import 'package:familia_flutter/components/parents.dart';
import 'package:familia_flutter/components/widgets/button.dart';
import 'package:familia_flutter/models/parents.model.dart';
import 'package:familia_flutter/themes/text.theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helpers/util.helper.dart';
import '../themes/colors.dart';

class UserDetail extends StatelessWidget {
  const UserDetail(
      {Key? key,
      required this.name,
      this.about,
      required this.parents,
      this.editOnPressed})
      : super(key: key);

  final String name;
  final String? about;
  final ParentsModel? parents;
  final Function()? editOnPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Text(
          name,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline4,
        ),
        if (about == '')
          const SizedBox(height: 32)
        else
          Container(
            margin: const EdgeInsets.symmetric(vertical: 32.0),
            child: Text(about!, style: bodyTextStyle),
          ),
        // if (parents != null && parents!.toList().isNotEmpty)
        Parents(
          parents: parents,
          emptyTitle: 'Добавьте родителя',
          decoration: BoxDecoration(
              color: AppColors.secondaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10)),
        ),
        AppButton(
            title: 'Редактировать',
            type: IAppButtonTypes.primary,
            onPressed: editOnPressed),
      ],
    );
  }
}
