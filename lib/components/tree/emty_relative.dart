import 'package:flutter/cupertino.dart';
import '../../../themes/sizes.dart';
import '../../../themes/text.theme.dart';
import '../common/user_pic.dart';


/// Компонент пустого пользователя для древа
/// onPressed(userId)? - callBack, в который передается преду пользователь или ""
/// title? - подпись


class EmptyRelative extends StatelessWidget {

  const EmptyRelative({Key? key, this.onTap, this.title}) : super(key: key);

  final GestureTapCallback? onTap;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: AppSizes.userPickWidth + 30,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            const UserPic(userPic: null),
            const SizedBox(height: 4),
            if (title != null)
              Text(
                title!,
                textAlign: TextAlign.center,
                style: miniTextStyle,
              )
          ],
        ),
      ),
    );
  }
}
