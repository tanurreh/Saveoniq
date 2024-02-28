// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:savoniq/app/core/components/components.dart';
import 'package:savoniq/app/core/globals/globals.dart';
import 'package:savoniq/app/modules/home/controllers/home_controller.dart';
import 'package:share_plus/share_plus.dart';

class DownloadDialog extends StatelessWidget {
  const DownloadDialog({
    Key? key,
    required this.title,
    required this.url,
    required this.onClose,
    required this.path,
  }) : super(key: key);
  final String title;
  final String url;
  final VoidCallback onClose;
  final String path;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (hc) {
        return AlertDialog(
          elevation: 0,
           backgroundColor: Colors.transparent,
       contentPadding: EdgeInsets.zero,
          content: Stack(
            children: [
               BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: SizedBox(
                          width: Get.height,
                          height: Get.width,
                         // color: Colors.black.withOpacity(0.5),
                        ),
                      ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 320.h,
                  width: 287.w,
                  decoration: BoxDecoration(
                     color:CustomColors.greybackground.withOpacity(0.8),
                     borderRadius: BorderRadius.circular(24.r)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                            onPressed: onClose,
                            icon: Icon(
                              Icons.close,
                              color: CustomColors.textgrey,
                            )),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 74.h,
                        width: 139.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24.r),
                          color: CustomColors.greybackground,
                          image: DecorationImage(
                              image: NetworkImage(url), fit: BoxFit.cover),
                        ),
                      ),
                      10.ht,
                      Flexible(
                        fit: FlexFit.loose,
                        child: Text(
                          title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 10.sp,
                              color: CustomColors.white,
                              fontWeight: CustomFontWeight.kRegularWeight),
                        ),
                      ),
                      16.ht,
                      Text(
                        'Download Successfully',
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: CustomColors.white,
                            fontWeight: CustomFontWeight.kBoldFontWeight),
                      ),
                      16.ht,
                      SizedBox(
                        height: 33.h,
                        child: CustomElevatedButton(
                          text: 'Close',
                          onPressed: onClose,
                          width: 106.w,
                          fontsize: 11.sp,
                        ),
                      ),
                      10.ht,
                      SizedBox(
                        height: 50.h,
                        width: 50.w,
                        child: IconButton(
                          icon: SvgPicture.asset(CustomAssets.kShareIcon),
                          onPressed: () async {
                         
                            XFile finalFile = XFile(hc.myFile!.path);
                          log(finalFile.name);
                                 await Share.shareXFiles([finalFile], subject: title);
                             
                            
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}

void showDownloadDialog(
    {required String message,
    required String downloadUrl,
    required VoidCallback onClose,
    required String path}) {
  Get.dialog(
    DownloadDialog(
        title: message, url: downloadUrl, onClose: onClose, path: path),
    barrierDismissible: false,
    name: message,
  );
}
