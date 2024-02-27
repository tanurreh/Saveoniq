// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
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
          content: SizedBox(
              width: 270.w,
              height: 180.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    SizedBox(
                          height: 70.h,
                          width: 70.w,
                          child: const RiveAnimation.asset(CustomAssets.KDownloadAnimation,
                          fit: BoxFit.contain,
                          )),
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
                  cc.percentage.toInt().toString(),
                  style: TextStyle(fontSize: 9.sp, color: CustomColors.white,fontWeight: CustomFontWeight.kRegularWeight),
                ),
              ]
            ))
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
