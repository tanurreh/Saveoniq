// ignore_for_file: public_member_api_docs, sort_constructors_first, deprecated_member_use
import 'package:savoniq/app/modules/landing/widgets/tab_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:savoniq/app/core/globals/assets.dart';
import 'package:savoniq/app/core/globals/globals.dart';

import '../controllers/landing_controller.dart';

class LandingView extends GetView<LandingController> {
  const LandingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LandingController>(
        init: LandingController(),
        builder: (lc) {
          return Scaffold(
              extendBody: true,

              // Container(
              //   height: 120.h,
              //   decoration: const BoxDecoration(
              //     color: Colors.transparent,
              //     image: DecorationImage(
              //         image: AssetImage(
              //           CustomAssets.kBottomBar,
              //         ),
              //         fit: BoxFit.cover),
              //   ),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: [
              //       TabBarIcons(
              //         title: 'Home',
              //         url: CustomAssets.kHomeIcon,
              //         isSelected: lc.currentIndex == 0,
              //         onTap: () {
              //           lc.changeCurrentIndex(0);
              //         },
              //       ),
              //        TabBarIcons(
              //         title: 'History',
              //         url: CustomAssets.kHomeIcon,
              //         isSelected: lc.currentIndex == 1,
              //         onTap: () {
              //           lc.changeCurrentIndex(1);
              //         },
              //       ),
              //        TabBarIcons(
              //         title: 'Tools',
              //         url: CustomAssets.kHomeIcon,
              //         isSelected: lc.currentIndex == 2,
              //         onTap: () {
              //           lc.changeCurrentIndex(2);
              //         },
              //       ),
              //        TabBarIcons(
              //         title: 'Settings',
              //         url: CustomAssets.kHomeIcon,
              //         isSelected: lc.currentIndex == 3,
              //         onTap: () {
              //           lc.changeCurrentIndex(3);
              //         },
              //       )
              //     ],
              //   ),
              // ),
              body: Stack(
                children: [
                  lc.screens[lc.currentIndex],
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: 120.h,
                      child: Stack(
                        children: [
                          Image.asset(
                            CustomAssets.kBottomBar,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TabBarIcons(
                                title: 'Home',
                                url: CustomAssets.kHomeIcon,
                                isSelected: lc.currentIndex == 0,
                                onTap: () {
                                  lc.changeCurrentIndex(0);
                                },
                              ),
                              TabBarIcons(
                                title: 'Settings',
                                url: CustomAssets.kSettingIcon,
                                isSelected: lc.currentIndex == 1,
                                onTap: () {
                                  lc.changeCurrentIndex(1);
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ));
        });
  }
}
