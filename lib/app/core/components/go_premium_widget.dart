
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:savoniq/app/core/components/components.dart';
import 'package:savoniq/app/core/globals/globals.dart';

class GoPremiumWidget extends StatelessWidget {
  final VoidCallback onPressed;
  const GoPremiumWidget({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335.w,
      height: 130.h,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(CustomAssets
              .kBackGroundContainer), // Path to your asset image
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            23.ht,
            Text(
              'Enjoy Your Favorite Tools',
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: CustomFontWeight.kRegularWeight,
                  color: CustomColors.white),
            ),
            3.ht,
            Text(
              'Go premium & enjoy unlimited conversion',
              style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: CustomFontWeight.kRegularWeight,
                  color: CustomColors.textgrey),
            ),
            14.ht,
            SizedBox(
              height: 28.h,
              child: ElevatedButton(
                onPressed: onPressed,
                 style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColors.primary,
                        fixedSize: Size(130.w, 26.h),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(68.r))),
                child: Text(
                  'GO PREMIUM',
                  style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: CustomFontWeight.kRegularWeight,
                      color: CustomColors.white),
                ),
              ),
            )
          ]),
    );
  }
}