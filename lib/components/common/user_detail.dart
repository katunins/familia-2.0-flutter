import 'package:familia_flutter/components/tree/parents.dart';
import 'package:familia_flutter/components/common/button.dart';
import 'package:familia_flutter/models/parents.model.dart';
import 'package:familia_flutter/themes/text.theme.dart';
import 'package:flutter/material.dart';
import '../../../themes/colors.dart';

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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          name,
          style: Theme.of(context).textTheme.headline4,
        ),
        if (about == '')
          const SizedBox(height: 32)
        else
          Container(
            margin: const EdgeInsets.only(top: 12, bottom: 36.0),
            child: Text(about ?? '', style: bodyTextStyle),
          ),
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
