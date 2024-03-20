// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';
import 'package:savoniq/app/core/globals/globals.dart';
import 'package:savoniq/app/modules/home/controllers/home_controller.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';


class ShowDownloadProgressDialog extends StatelessWidget {
  const ShowDownloadProgressDialog({
    Key? key,
    required this.message,
    required this.value,
  }) : super(key: key);
  final String message;
  final double value;

  @override
  Widget build(BuildContext context) { 
    return GetBuilder<HomeController>(
      builder: (cc) {
        return AlertDialog(
          elevation: 0,
           backgroundColor: Colors.transparent,
       contentPadding: EdgeInsets.zero,
          content: Stack(
            children: [
                BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: SizedBox(
                          width: Get.height,
                          height: Get.width,
                         // color: Colors.black.withOpacity(0.5),
                        ),
                      ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                    width: 270.w,
                    height: 180.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                          Center(
                            child: SizedBox(
                                  height: 70.h,
                                  width: 70.w,
                                  child: const RiveAnimation.asset(CustomAssets.kDownloadAnimation,
                                  fit: BoxFit.contain,
                                  )),
                          ),
                         SizedBox(height: 30.w),
                         ProgressBar(
                          height: 4.h,
                          width: 161.w,
                      value: cc.percentage/100,
                      color: CustomColors.primary,
                      backgroundColor: CustomColors.white,
                    ),
                    SizedBox(height: 9.h,),
                     Text(
                        '${cc.percentage.toInt().toString()} %',
                        style: GoogleFonts.inter(fontSize: 9.sp, color: CustomColors.white,fontWeight: CustomFontWeight.kRegularWeight),
                      ),
                    ]
                  )),
              ),
            ],
          )
          );
      }
    );
  }
}

void showProgressDialog({required String message, required double value}) {
  Get.dialog(
    ShowDownloadProgressDialog(message: message, value: value,),
    barrierDismissible: false,
    name: message,
  );
}

void hideProgressDialog() {
  Get.back();
  return;
}
