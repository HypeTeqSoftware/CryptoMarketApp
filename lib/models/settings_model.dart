import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsModel {
  String title;
  String subTitle;
  IconData icons;

  SettingsModel(
      {required this.title, required this.subTitle, required this.icons});
}

List<SettingsModel> list = [
  SettingsModel(
      title: "Edit Profile",
      subTitle: "Edit your profile.",
      icons: Icons.person_2_outlined),
  SettingsModel(
      title: "Privacy Policy",
      subTitle: "How we works.",
      icons: Icons.security),
  SettingsModel(
      title: "About Us",
      subTitle: "What we are.",
      icons: CupertinoIcons.exclamationmark_circle),
  SettingsModel(
      title: "Help",
      subTitle: "How can we help you.",
      icons: Icons.help_outline_sharp),
  SettingsModel(
      title: "Sign Out",
      subTitle: "Sign out from application.",
      icons: Icons.logout_sharp),
];
