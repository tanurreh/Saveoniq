import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:savoniq/app/core/globals/globals.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return  SpinKitWaveSpinner(color: CustomColors.primary,
    trackColor: CustomColors.primary.withOpacity(0.6),
    waveColor: CustomColors.primary.withOpacity(0.6) ,
    size: 60.sp,
    );
  }
}