// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:savoniq/app/core/components/components.dart';
import 'package:savoniq/app/core/globals/globals.dart';
import 'package:savoniq/app/core/globals/toc_and_pp.dart';
import 'package:savoniq/app/modules/settings/views/toc_pp_screen.dart';
import 'package:savoniq/app/modules/settings/widget/setting_button.dart';


import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackGroundWrapper(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 29.w),
            child: Column(
              children: [
                12.ht,
                const HeaderWidget(),
                18.ht,
                const Divider(
                  color: CustomColors.greybackground,
                ),
                24.ht,
                SettingButton(
                  title: 'Terms & Condition',
                  widget: SizedBox(
                    width: 50.w,
                  ),
                  onTap: () {
                    Get.to(()=> TocAndPpScreen(title: 'Terms & Condition', details: TocAndPP.termsAndCondition,));
                  },
                ),
                10.ht,
                SettingButton(
                  title: 'Privacy Policy',
                  widget: SizedBox(
                    width: 50.w,
                  ),
                  onTap: () {
                       Get.to(()=> TocAndPpScreen(title: 'Privacy Policy', details: TocAndPP.privacyPolicy,));
                  },
                ),
                10.ht,
                // SettingButton(
                //   title: 'Refer a friend',
                //   widget: SizedBox(
                //     width: 40.w,
                //     child: IconButton(
                //       icon: SvgPicture.asset(CustomAssets.kShareIcon),
                //       onPressed: () {},
                //     ),
                //   ),
                //   onTap: () {},
                // ),
               // 10.ht,
              ],
            ),
          ),
        ));
  }
}

