// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:savoniq/app/core/components/components.dart';
import 'package:savoniq/app/core/globals/globals.dart';

class TocAndPpScreen extends StatelessWidget {
  final String title;
  final String details;
  const TocAndPpScreen({
    Key? key,
    required this.title,
    required this.details,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundWrapper(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: Align(
              alignment: Alignment.centerLeft,
              child: IconButton(onPressed: () {Get.back();}, icon:  Icon(Icons.arrow_back_ios,
              size: 18.sp,
              color: CustomColors.white,
              ))),
          ),
          SizedBox(
              height: 94.h,
              width: 73.w,
              child: SvgPicture.asset(CustomAssets.kAppLogo)),
          25.ht,
          Text(
            title,
            style: GoogleFonts.inter(
                fontSize: 13.sp,
                fontWeight: CustomFontWeight.kSemiBoldFontWeight,
                color: CustomColors.white),
          ),
          27.ht,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 17.h),
            height: 540.h,
            width: 335.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.r),
                color: CustomColors.greybackground),
            child: SingleChildScrollView(
              child: Text(
                details,
                style: GoogleFonts.inter(
                    fontSize: 13.sp,
                    fontWeight: CustomFontWeight.kRegularWeight,
                    color: CustomColors.white),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
