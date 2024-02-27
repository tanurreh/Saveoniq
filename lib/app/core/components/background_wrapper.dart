// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:savoniq/app/core/globals/globals.dart';

class BackGroundWrapper extends StatelessWidget {
  final Widget child;
  const BackGroundWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 56.h),
      decoration: const BoxDecoration(
        image:   DecorationImage(image: AssetImage(CustomAssets.kBackgroundScreen),
          fit: BoxFit.cover
        ),
      ),
      child: child,
    );
  }
}
