import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../models/gender.enum.dart';
import '../../stores/genderSelector.controller.dart';

class GenderSelector extends StatelessWidget {
  const GenderSelector({Key? key, required this.controller, required this.onChanged}) : super(key: key);
  final GenderSelectorController controller;
  final Function(Gender?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) => Container(
        padding:
        const EdgeInsets.only(top: 20.0, bottom: 20.0, left: 20.0, right: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: controller.isError ? Colors.red : Colors.grey, width: 1)),
        child: DropdownButton<Gender>(
            isDense: true,
            isExpanded: true,
            underline: Container(),
            borderRadius: BorderRadius.circular(5),
            alignment: Alignment.bottomCenter,
            value: controller.gender,
            items: const [
              DropdownMenuItem(
                value: null,
                child: Text('Укажите пол'),
              ),
              DropdownMenuItem(
                value: Gender.male,
                child: Text('Мужской'),
              ),
              DropdownMenuItem(
                value: Gender.female,
                child: Text('Женский'),
              )
            ],
            onChanged: (value) {
              controller.setGender(value);
              onChanged(value);
            }
          // style: Theme.of(context).textTheme.title,
        ),
      ));
  }
}