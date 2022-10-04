import 'package:familia_flutter/stores/app.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

getPrimaryButton(
    {void Function()? onPressed,
    required String title,
    bool isLockedOnLoading = false}) {
  return Observer(builder: (_) {
    var child = isLockedOnLoading && appStore.isLoading
        ? const CircularProgressIndicator(strokeWidth: 3.0)
        : Text(title);
    return ElevatedButton(
        onPressed: appStore.isLoading ? null : onPressed, child: child);
  });
}
