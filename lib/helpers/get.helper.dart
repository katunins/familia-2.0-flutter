import 'package:familia_flutter/themes/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

showDialog({
  String title = 'Ошибка',
  required String middleText,
  VoidCallback? onConfirm,
  VoidCallback? onCancel,
  VoidCallback? onCustom,
  String? textConfirm,
  Widget? content,
  String? textCustom,
}) {
  Get.defaultDialog(
      title: title,
      content: content,
      middleText: middleText,
      buttonColor: AppColors.primaryColor,
      confirmTextColor: Colors.white,
      confirm: _getButton(text: textConfirm ?? 'ok', callback: onConfirm ?? (){
        Get.back(closeOverlays: true);
      }),
      radius: 10.0,
      titlePadding: const EdgeInsets.only(top: 20.0),
      titleStyle: const TextStyle(fontFamily: 'Raleway'),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0));
}

Widget _getButton({VoidCallback? callback, required String text}) {
  return ElevatedButton(
      onPressed: callback,
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.black54),
        shadowColor: MaterialStatePropertyAll(Colors.transparent),
        padding: MaterialStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0)),
      ),
      child: Text(text));
}
