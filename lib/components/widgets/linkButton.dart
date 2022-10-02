import 'package:flutter/material.dart';

import '../../themes/colors.dart';

getLinkButton({required String text, VoidCallback? onPressed, bool isGrey = false}) {
  return ElevatedButton(
    style: ButtonStyle(
        foregroundColor: MaterialStatePropertyAll(isGrey ? Colors.grey : AppColors.secondaryColor),
        backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
        shadowColor: const MaterialStatePropertyAll(Colors.transparent)
    ),
    onPressed: onPressed,
    child: Text(text),
  );
}
