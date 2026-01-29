import 'package:flutter/material.dart';

class ToastUtils {
  static bool _showloading = false;
  static void showToast(BuildContext context, String? msg) {
    if (_showloading) {
      return;
    }
    _showloading = true;
    Future.delayed( Duration(seconds: 3), () {
      _showloading = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: 120,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(40),
        ),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 3),
        content: Text(msg ?? "加载成功", textAlign: TextAlign.center),
      ),
    );
  }
}