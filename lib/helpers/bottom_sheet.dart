import 'package:familia_flutter/components/common/button.dart';

import 'package:flutter/material.dart';

import '../themes/sizes.dart';

class BottomSheetHelper {
  static void show(
      {required BuildContext context,
      bool isScrollControlled = false,
      required Widget widget}) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: isScrollControlled,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        ),
        builder: (_) => widget);
  }

  static void message(
      {required BuildContext context,
      String? message,
      List<AppButton> actions = const []}) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16)),
      ),
      builder: (_) => Container(
          padding: EdgeInsets.all(AppSizes.marginHorizontal),
          child: Wrap(
            children: [
              if (message != null)
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 20, top: 10),
                  child: Text(message,
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center),
                ),
              ...actions,
              if (actions.isEmpty)
                AppButton(
                    title: 'Закрыть',
                    onPressed: Navigator.of(context).pop,
                    type: IAppButtonTypes.secondary),
              const SizedBox(
                height: 100,
              )
            ],
          )),
    );
  }
}
