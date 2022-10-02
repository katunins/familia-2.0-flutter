import 'package:flutter/material.dart';

getRemoveSuffix(
    {required VoidCallback onPressed,
    required TextEditingController textEditingController}) {
  if (textEditingController.text.isEmpty) {
    return null;
  }
  return IconButton(
    onPressed: onPressed,
    icon: const Icon(
      Icons.clear,
      size: 18.0,
    ),
  );
}
