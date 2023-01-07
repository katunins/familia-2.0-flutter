import 'package:familia_flutter/themes/colors.dart';
import 'package:flutter/cupertino.dart';

class LabelCount extends StatelessWidget {
  const LabelCount({Key? key, required this.count}) : super(key: key);

  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.greyColor),
        borderRadius: BorderRadius.circular(5),
        color: AppColors.whiteColor.withOpacity(0.5),
      ),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      child: Text('+$count',
          style: const TextStyle(fontFamily: 'Roboto', fontSize: 16)),
    );
  }
}
