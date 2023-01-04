import 'package:auto_route/auto_route.dart';
import 'package:familia_flutter/components/widgets/userPick.dart';
import 'package:familia_flutter/routers/appRouter.gr.dart';
import 'package:familia_flutter/stores/relativeItem.store.dart';
import 'package:familia_flutter/themes/sizes.dart';
import 'package:familia_flutter/themes/text.theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../stores/familyTires.store.dart';

class RelativeListItem extends StatelessWidget {
  const RelativeListItem({Key? key, required this.relative}) : super(key: key);

  final RelativeItemStore relative;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        var tireType = familyTires.getType(relative.data);
        var userPic = relative.data.userData.userPic;

        return Container(
          margin: EdgeInsets.only(bottom: AppSizes.insideMargin),
          child: GestureDetector(
            onTap: () =>
                context.router.push(RelativeDetailRouter(relative: relative)),
            child: Flex(
              crossAxisAlignment: CrossAxisAlignment.start,
              direction: Axis.horizontal,
              children: [
                UserPick(userPic: userPic),
                SizedBox(width: AppSizes.insideMargin),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      relative.data.userData.name,
                      style: bodyTextBoldStyle,
                    ),
                    const SizedBox(height: 5),
                    if (tireType != null) Text(tireType),
                  ],
                )),
                const Icon(Icons.keyboard_arrow_right)
              ],
            ),
          ),
        );
      },
    );
  }
}
