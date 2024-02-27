// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:savoniq/app/core/globals/globals.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  double? fontsize;
  CustomElevatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.width,
    this.fontsize = 16
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: CustomColors.primary,
          fixedSize: Size(width, 52.h),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.r))),
      child: Text(
        text,
        style: TextStyle(
            fontSize: fontsize,
            fontWeight: CustomFontWeight.kBoldFontWeight,
            color: CustomColors.white),
      ),
    );
  }
} 