// ignore_for_file: deprecated_member_use

import 'package:savoniq/app/core/components/components.dart';
import 'package:savoniq/app/core/globals/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TabBarIcons extends StatelessWidget {
  final String title;
  final String url;
  final bool isSelected;
  final VoidCallback onTap;
  const TabBarIcons({
    Key? key,
    required this.title,
    required this.url,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: 22.h,
              width: 22.h,
              child: SvgPicture.asset(
                url,
                color: isSelected ? CustomColors.white : CustomColors.textgrey,
              )),
          8.ht,
          Text(
            title,
            style: TextStyle(
                fontSize: 9.sp,
                fontWeight: CustomFontWeight.kMediumFontWeight,
                color: isSelected ? CustomColors.white : CustomColors.textgrey),
          ),
        ],
      ),
    );
  }
}
