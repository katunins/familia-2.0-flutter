import 'package:familia_flutter/components/common/image_widget.dart';
import 'package:flutter/cupertino.dart';

import '../../../themes/colors.dart';

/// Компонент с фотографией, в правом углу которой разсположена кнопка
/// icon - иконка кнопки
/// path - путь к изображению
/// onTap - callBack кнопки

class ImageWithButton extends StatelessWidget {
  const ImageWithButton(
      {Key? key, required this.path, this.onTap, required this.icon})
      : super(key: key);

  final String path;
  final Function()? onTap;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        getImageWidget(path: path),
        Positioned(
            right: 20,
            bottom: 20,
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.whiteColor,
                ),
                padding: const EdgeInsets.all(7),
                child: icon,
              ),
            ))
      ],
    );
  }
}
