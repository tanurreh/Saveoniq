
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:savoniq/app/core/components/components.dart';
import 'package:savoniq/app/core/globals/globals.dart';
import 'package:savoniq/app/routes/app_pages.dart';

import '../controllers/termsandcondition_controller.dart';

class TermsandconditionView extends GetView<TermsandconditionController> {
  const TermsandconditionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundWrapper(
          child: GetBuilder<TermsandconditionController>(
            init:  TermsandconditionController(),
            builder: (sc) {
              return Column(
                      children: [
              60.ht,
              SizedBox(
                  height: 94.h,
                  width: 73.w,
                  child: SvgPicture.asset(CustomAssets.kAppLogo)),
              25.ht,
              Text(
                'Terms & Conditions',
                style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: CustomFontWeight.kSemiBoldFontWeight,
                    color: CustomColors.white),
              ),
              27.ht,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 17.h),
                height: 410.h,
                width: 335.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.r),
                    color: CustomColors.greybackground),
                child: SingleChildScrollView(
                  child: Text(
                    privacypolicy,
                    style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: CustomFontWeight.kRegularWeight,
                        color: CustomColors.white),
                  ),
                ),
              ),
              13.ht,
              Padding(
                 padding: EdgeInsets.only(left: 33.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20.h,
                      width: 20.w,
                      child: Checkbox(
                        value: sc.isCheck,
                        onChanged: (bool? value) {
                          sc.changeCheck();
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.r),
                          side: const BorderSide(
                              color: CustomColors.white), // Border color
                        ),
                        fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.selected)) {
                              // Checked state
                              return Colors.white; // Fill color when checked
                            }
                            return Colors.transparent; // Fill color when unchecked
                          },
                        ),
                        checkColor: Colors.black, // Color of the checkmark
                        splashRadius:
                            20, // Increase the splash radius for better tapping experience
                      ),
                    ),
                    4.wt,
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Accept ',
                            style: TextStyle(
                                color: CustomColors.white,
                                fontSize: 13.sp,
                                fontWeight: CustomFontWeight.kRegularWeight),
                          ),
                          TextSpan(
                            text: 'Terms & Condition',
                            style: TextStyle(
                                color: CustomColors.white,
                                fontSize: 13.sp,
                                fontWeight: CustomFontWeight.kBoldFontWeight),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              13.ht,
              CustomElevatedButton(text: 'CONTINUE', onPressed: (){
                if(sc.isCheck){
                    final box = GetStorage();
                  box.write('showTermsAndCond', true);
                  Get.toNamed(Routes.LANDING);
                }else {
                  Fluttertoast.showToast(msg: 'Please mark check for Terms & Condition');
                }
                
              }, width: 335.w),
              
                      ],
                    );
            }
          )),
    );
  }
}
