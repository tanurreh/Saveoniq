import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:savoniq/app/core/components/components.dart';
import 'package:savoniq/app/core/globals/globals.dart';
import 'package:savoniq/app/modules/home/widgets/progress_bar_dialog.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<HomeController>(
            init: HomeController(),
            builder: (hc) {
              return BackGroundWrapper(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 29.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      12.ht,
                      const HeaderWidget(),
                      18.ht,
                      Form(
                        key: _formKey,
                        child: Container(
                          height: 68.h,
                          width: 335.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.r),
                              color: CustomColors.greybackground),
                          child: Row(children: [
                            30.wt,
                            Expanded(
                              flex: 4,
                              child: TextFormField(
                                controller: hc.searchController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter link';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Paste the URL here',
                                  hintStyle: TextStyle(
                                      color: CustomColors.textgrey,
                                      fontSize: 12.sp,
                                      fontWeight:
                                          CustomFontWeight.kRegularWeight),
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(
                                    color: CustomColors.textgrey,
                                    fontSize: 12.sp,
                                    fontWeight:
                                        CustomFontWeight.kRegularWeight),
                              ),
                            ),
                            hc.searchController.text.isNotEmpty
                                ? Expanded(
                                    flex: 1,
                                    child: IconButton(
                                        onPressed: () {
                                          hc.searchController.clear();
                                          hc.update();
                                        },
                                        icon: Icon(
                                          Icons.close,
                                          color: CustomColors.textgrey,
                                          size: 14.sp,
                                        )),
                                  )
                                : const SizedBox.shrink(),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.h),
                              child: CustomElevatedButton(
                                text: 'Search',
                                onPressed: hc.isError
                                    ? () {}
                                    : () {
                                        if (hc.searchController.text.isNotEmpty) {
                                          if (hc.searchController.text.isURL) {
                                            FocusScope.of(context).unfocus();
                                            hc.onSearch(hc
                                                .searchController.text
                                                .toString());
                                          } else {
                                            Fluttertoast.showToast(
                                                msg:
                                                    'Please add appropiate Url');
                                          }
                                        } else {
                                          Fluttertoast.showToast(
                                              msg: 'Please Enter Url ');
                                        }
                                      },
                                width: 92.w,
                                fontsize: 11.sp,
                              ),
                            ),
                            10.wt
                          ]),
                        ),
                      ),
                      21.ht,
                      if (hc.isError)
                        if (hc.video != null )
                          Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 180.h,
                                width: 335.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24.r),
                                  color: CustomColors.greybackground,
                                  image: DecorationImage(
                                      image:
                                          NetworkImage(hc.video!.images![0]),
                                      fit: BoxFit.cover),
                                ),
                                child: Image.asset(
                                  CustomAssets.kPlayIcon,
                                  height: 62.h,
                                  width: 62.w,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              21.ht,
                              CustomElevatedButton(
                                  text: 'DOWNLOAD',
                                  onPressed: () {
                                    hc.downloadMedia(
                                        '${hc.video!.title!}.mp4');
                                    showProgressDialog(
                                        message: hc.percentage.toString(),
                                        value: hc.percentage);
                                  },
                                  width: 335.w),
                            ],
                          )
                        else
                          Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 180.h,
                                width: 335.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24.r),
                                  color: CustomColors.greybackground,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 58.h,
                                      width: 58.w,
                                      child: SvgPicture.asset(
                                          CustomAssets.kBlockIcom),
                                    ),
                                    11.ht,
                                    Text(
                                      'File not found !',
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight:
                                              CustomFontWeight.kBoldFontWeight,
                                          color: CustomColors.white),
                                    ),
                                  ],
                                ),
                              ),
                              21.ht,
                              CustomElevatedButton(
                                  text: 'Retry',
                                  onPressed: () {
                                    hc.onDownloadClose();
                                  },
                                  width: 332.w)
                            ],
                          ),
                      if (hc.isLoading == true)
                        Container(
                            height: 180.h,
                            width: 335.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24.r),
                                color: CustomColors.greybackground),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CustomLoader(),
                                5.ht,
                                Text(
                                  'Searching...',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight:
                                          CustomFontWeight.kRegularWeight,
                                      color: CustomColors.textgrey),
                                )
                              ],
                            ))
                    ],
                  ),
                ),
              );
            }));
  }
}
