import 'package:crypto_app/constants/app_colors.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  TextEditingController? controller;
  Widget? suffixIcon;
  Widget? prefixIcon;
  String hintText;
  bool obscureText;
  String? Function(String?)? validator;
  TextFieldWidget(
      {this.controller,
      this.prefixIcon,
      this.suffixIcon,
      required this.hintText,
      this.validator,
        this.obscureText = false,
      Key? key})
      : super(key: key);

  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
      width: 1,
      color: AppColors.primary,
      style: BorderStyle.solid,
    ),
  );

  final errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide:  const BorderSide(
      color: AppColors.red,
      width: 1,
      style: BorderStyle.solid,
    ),);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                blurRadius: 6.0,
                color: AppColors.primary200,
                offset: const Offset(2, 0)),
          ]),
      child: TextFormField(
        controller: controller,
        validator: validator,
        obscureText: obscureText,
        decoration: InputDecoration(
            focusedBorder: border,
            errorStyle: const TextStyle(fontSize: 0.01),
            errorBorder:errorBorder,
            focusedErrorBorder: errorBorder,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            border: InputBorder.none,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintText: hintText),
      ),
    );
  }
}
