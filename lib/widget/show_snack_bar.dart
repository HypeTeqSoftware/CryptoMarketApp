import 'package:crypto_app/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ShowSnackBar {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static void showSnackBar(
      {required String text,
        Color? snackBarBackgroundColor,
      Color? textColor,
      double? fontSize,
      FontWeight? fontWeight}) {
    messengerKey.currentState!
      // ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
        duration: Duration(milliseconds: 800),
        backgroundColor: snackBarBackgroundColor,
        behavior: SnackBarBehavior.floating,
      ));
  }

  static void errorSnackBar({required String text}){
    ShowSnackBar.showSnackBar(
        text: text,
        snackBarBackgroundColor: AppColors.red,
        fontWeight: FontWeight.bold);
  }

  static void removeSnackBar(){
    messengerKey.currentState!.removeCurrentSnackBar();
  }
}
