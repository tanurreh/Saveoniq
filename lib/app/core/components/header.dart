
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:savoniq/app/core/globals/globals.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Welcome To ',
              style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
            ),
            Image.asset(CustomAssets.kHiIcon,
            height: 14.h,
            width: 16.w,
            )
          ],
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Save',
                style: TextStyle(
                    color: CustomColors.white,
                    fontSize: 24.sp,
                    fontWeight: CustomFontWeight.kBoldFontWeight),
              ),
              TextSpan(
                text: 'oniq',
                style: TextStyle(
                    color: CustomColors.white,
                    fontSize: 24.sp,
                    fontWeight: CustomFontWeight.kRegularWeight),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
