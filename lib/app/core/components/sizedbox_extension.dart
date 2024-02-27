// ignore_for_file: camel_case_extensions

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension padding on num {
  SizedBox get ht => SizedBox(
        height: toDouble().h,
      );
  SizedBox get wt => SizedBox(
        width: toDouble().w,
      );
}
