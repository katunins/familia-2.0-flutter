import 'package:flutter/material.dart';

getRemoveSuffix({required TextEditingController controller}) {
  return IconButton(
    onPressed: () {
      controller.text = '';
    },
    icon: const Icon(
      Icons.clear,
      size: 18.0,
    ),
  );
}
