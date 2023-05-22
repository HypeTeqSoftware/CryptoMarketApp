import 'package:crypto_app/constants/app_colors.dart';
import 'package:crypto_app/constants/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  void Function()? onPressed;
  String text;
  ButtonWidget({required this.onPressed,required this.text,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 45,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
            onPressed: onPressed, child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(text,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),const SizedBox(width: 13),const Icon(CupertinoIcons.arrow_right),
              ],
            )));
  }
}
