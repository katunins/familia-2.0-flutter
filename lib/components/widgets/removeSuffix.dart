import 'package:flutter/material.dart';

getRemoveSuffix(
    {required VoidCallback onPressed}) {
  return IconButton(
    onPressed: onPressed,
    icon: const Icon(
      Icons.clear,
      size: 18.0,
    ),
  );
}
