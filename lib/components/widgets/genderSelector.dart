import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/gender.enum.dart';

/// Компонент выбора пола

class GenderSelector extends StatelessWidget {
  const GenderSelector({Key? key, required this.value, required this.onChanged, this.error}) : super(key: key);
  final Gender value;
  final Function(Gender?) onChanged;
  final String? error;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:
        const EdgeInsets.only(top: 20.0, bottom: 20.0, left: 20.0, right: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: error != null ? Colors.red : Colors.grey, width: 1)),
        child: DropdownButton<Gender>(
            isDense: true,
            isExpanded: true,
            underline: Container(),
            borderRadius: BorderRadius.circular(5),
            alignment: Alignment.bottomCenter,
            value: value,
            items: const [
              DropdownMenuItem(
                value: Gender.none,
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
            onChanged: onChanged
          // style: Theme.of(context).textTheme.title,
        ),
      );
  }
}