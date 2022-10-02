import 'package:flutter/material.dart';

import '../../themes/colors.dart';

getFloatingButton() =>
    FloatingActionButton(
      backgroundColor: AppColors.primaryColor,
      child: const Icon(Icons.add, size: 30),
      onPressed: () {},
    );