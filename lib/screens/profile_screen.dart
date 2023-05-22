import 'package:crypto_app/constants/app_colors.dart';
import 'package:crypto_app/constants/app_images.dart';
import 'package:crypto_app/constants/size_config.dart';
import 'package:crypto_app/models/settings_model.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuerySize.height / 2.9,
          decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40))),
        ),
        Scaffold(
          backgroundColor: AppColors.transparent,
          body: Padding(
            padding: EdgeInsets.only(left: 17,right: 17,top:MediaQuerySize.height/7),
            child: Center(
              child: Container(
                height: MediaQuerySize.height / 1.8,
                width: MediaQuerySize.width,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 4.0,
                          color: AppColors.primary200,
                          offset: const Offset(1, 0)),
                    ],
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(26)),
                child: Stack(
                  alignment: Alignment.topCenter,
                  clipBehavior: Clip.none,
                  children: [
                     Positioned(
                      top: -40,
                      child: Column(
                        children: const [
                          CircleAvatar(
                            radius: 48,
                            backgroundColor: AppColors.white,
                            backgroundImage: AssetImage(AppImages.user),
                          ),
                           Text(
                            "user name",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                           Text("user@user.com"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top:MediaQuerySize.height/8),
                      child: Center(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: list.map((e) {
                                  int i = list.indexOf(e);
                                  return Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2.0, horizontal: 14.0),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(e.icons,
                                                    size: 25, color: AppColors.primary),
                                                const SizedBox(width: 17),
                                                Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text(e.title,
                                                        style: const TextStyle(
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 14)),
                                                    Text(e.subTitle,
                                                        style: TextStyle(
                                                            color: AppColors
                                                                .grey.shade600, fontSize: 12)),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Icon(Icons.arrow_forward_ios_sharp,
                                                size: 15, color: AppColors.primary400)
                                          ],
                                        ),
                                      ),
                                      i == 4 ? const SizedBox.shrink() : const Divider(endIndent: 20,indent: 20,)
                                    ],
                                  );
                                }).toList(),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
