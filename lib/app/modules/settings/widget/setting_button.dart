import 'package:savoniq/app/core/globals/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingButton extends StatelessWidget {
  final String title;
  final Widget widget;
  final VoidCallback onTap;
  const SettingButton({
    Key? key,
    required this.title,
    required this.widget,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(left: 29.w, right: 25.w),
        height: 68.h,
        width: 335.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.r),
            color: CustomColors.greybackground),
        child: Row(children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 13.sp,
                fontWeight: CustomFontWeight.kRegularWeight,
                color: CustomColors.white),
          ),
          const Spacer(),
          widget,
        ]),
      ),
    );
  }
}
