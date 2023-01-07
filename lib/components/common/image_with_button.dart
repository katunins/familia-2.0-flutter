import 'package:familia_flutter/components/common/image_widget.dart';
import 'package:familia_flutter/components/icons/app_icon_button.dart';
import 'package:familia_flutter/themes/sizes.dart';
import 'package:flutter/cupertino.dart';

import '../../../themes/colors.dart';

/// Компонент с фотографией, в правом углу которой разсположена кнопка
/// icon - иконка кнопки
/// path - путь к изображению
/// onTap - callBack кнопки

class ImageWithButton extends StatelessWidget {
  const ImageWithButton(
      {Key? key, required this.path, required this.onTap, required this.icon})
      : super(key: key);

  final String path;
  final Function() onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        getImageWidget(path: path),
        Positioned(
            right: AppSizes.marginHorizontal,
            bottom: 20,
            child: AppIconButton(
              icon: icon,
              backgroundColor: AppColors.whiteColor,
              onTap: onTap,
            ))
      ],
    );
  }
}
