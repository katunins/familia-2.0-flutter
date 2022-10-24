import 'package:familia_flutter/models/relative.model.dart';
import 'package:familia_flutter/screens/relativesScreen/relativeDetailScreen.dart';
import 'package:familia_flutter/stores/relativeItem.store.dart';
import 'package:familia_flutter/themes/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../components/widgets/imageWidget.dart';

class RelativeListItem extends StatelessWidget {
  const RelativeListItem({Key? key, required this.relative}) : super(key: key);

  final RelativeItemStore relative;

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.only(bottom: AppSizes.insideMargin),
        child: Observer(builder: (_)=>GestureDetector(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => RelativeDetailScreen(relative: relative))),
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
                    path: relative.data.userData?.userPic ?? ''),
              ),
              SizedBox(width: AppSizes.insideMargin),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        relative.data.userData!.name!,
                        // maxLines: 1,
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      const SizedBox(height: 5),
                      // Text(relative.userData.gender?.name ?? '-'),
                      if (relative.data.userData?.about != null)
                        Text(
                          relative.data.userData!.about!,
                          style: Theme.of(context).textTheme.bodyMedium,
                          maxLines: 2,
                        ),
                    ],
                  )),
              const Icon(Icons.keyboard_arrow_right)
            ],
          ),
        ),),
      );
}
