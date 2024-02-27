
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:savoniq/app/core/components/components.dart';
import 'package:savoniq/app/core/globals/globals.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init:  SplashController(),
      builder: (splash) {
        return Scaffold(
          body: BackGroundWrapper(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
               SizedBox(
                      height: 94.h,
                      width: 73.w,
                      child: SvgPicture.asset(CustomAssets.kAppLogo)),
                19.ht,
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'SAVE',
                        style: TextStyle(
                            color: CustomColors.white,
                            fontSize: 29.sp,
                            fontWeight: CustomFontWeight.kBoldFontWeight),
                      ),
                      TextSpan(
                        text: 'ONIQ',
                        style: TextStyle(
                            color: CustomColors.white,
                            fontSize: 29.sp,
                            fontWeight: CustomFontWeight.kRegularWeight),
                      ),
                    ],
                  ),
                )
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
