import 'package:auto_route/auto_route.dart';
import 'package:familia_flutter/helpers/family_ties.dart';
import 'package:familia_flutter/models/relative.model.dart';
import 'package:familia_flutter/routers/app_router.gr.dart';
import 'package:familia_flutter/stores/user.store.dart';
import 'package:familia_flutter/themes/sizes.dart';
import 'package:familia_flutter/themes/text.theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../components/common/user_pic.dart';

class RelativeListItem extends StatelessWidget {
  const RelativeListItem({super.key, required this.relative});

  final RelativeModel relative;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        var tireType = FamilyTies(rootUser: userStore.user!.toTreeElement()).getType(relative.toTreeElement());
        var userPic = relative.userData.userPic;

        return Container(
          margin: EdgeInsets.only(bottom: AppSizes.insideMargin),
          child: GestureDetector(
            onTap: () =>
                context.router.push(RelativeDetailRouter(id: relative.id)),
            child: Flex(
              crossAxisAlignment: CrossAxisAlignment.start,
              direction: Axis.horizontal,
              children: [
                UserPic(userPic: userPic),
                SizedBox(width: AppSizes.insideMargin),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      relative.userData.name,
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
