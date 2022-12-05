import 'package:familia_flutter/themes/colors.dart';
import 'package:familia_flutter/themes/text.theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

closePopup() {
  Get.back(closeOverlays: true);
}

showPopup({
  String title = 'Ошибка',
  required String middleText,
  VoidCallback? onConfirm,
  VoidCallback? onCancel,
  VoidCallback? onCustom,
  String? textConfirm,
  String? textCancel,
  Widget? content,
  String? textCustom,
}) {
  Get.defaultDialog(
      title: title,
      content: content,
      middleText: middleText,
      buttonColor: AppColors.primaryColor,
      confirmTextColor: AppColors.whiteColor,
      confirm: _getButton(
          text: textConfirm ?? 'ok', callback: _getCallBack(onConfirm)),
      cancel: onCancel == null
          ? null
          : _getButton(
              text: textCancel ?? 'Отменить',
              callback: _getCallBack(onCancel),
              backgroundColor: AppColors.greyColor),
      radius: 10.0,
      titlePadding: const EdgeInsets.only(top: 20.0),
      titleStyle: headlineStyle,
      middleTextStyle: bodyTextStyle,
      contentPadding:
          const EdgeInsets.all(30.0));
}

_getCallBack(Function? callback) {
  return () async {
    if (callback != null) {
      await callback();
    }
    closePopup();
  };
}

Widget _getButton(
    {VoidCallback? callback, required String text, Color? backgroundColor}) {
  return ElevatedButton(
      onPressed: callback,
      style: ButtonStyle(
        backgroundColor:
            MaterialStatePropertyAll(backgroundColor ?? AppColors.primaryColor),
        shadowColor: const MaterialStatePropertyAll(Colors.transparent),
        textStyle: MaterialStatePropertyAll(bodyTextStyle),
        padding: const MaterialStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 30.0, vertical: 14.0)),
      ),
      child: Text(text));
}
