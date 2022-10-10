import 'package:familia_flutter/models/relative.model.dart';
import 'package:familia_flutter/themes/sizes.dart';
import 'package:flutter/material.dart';

import '../../components/widgets/imageWidget.dart';

class RelativeListItem extends StatelessWidget {
  const RelativeListItem({Key? key, required this.relative}) : super(key: key);

  final RelativeModel relative;

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.only(bottom: AppSizes.insideMargin),
        child: Flex(
          crossAxisAlignment: CrossAxisAlignment.start,
          direction: Axis.horizontal,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: getImageWidget(
                  width: AppSizes.userPickWidth,
                  height: AppSizes.userPickWidth,
                  fit: BoxFit.cover,
                  path: relative.userData?.userPic ?? ''),
            ),
            SizedBox(width: AppSizes.insideMargin),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  relative.userData!.name!,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                const SizedBox(height: 5),
                if (relative.userData?.about != null)
                  Text(
                    relative.userData!.about!,
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 3,
                  ),
              ],
            ))
          ],
        ),
      );
}
