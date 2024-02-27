
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:savoniq/app/core/theme/app_theme.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await GetStorage.init();
  runApp(ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return const Savoniq();
      }));
}



class Savoniq extends StatelessWidget {
  const Savoniq({super.key});

  @override
  Widget build(BuildContext context) {
           // Set the status bar to transparent with white icons
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Make the status bar transparent
      statusBarIconBrightness: Brightness.light, // Set the status bar icons to white
    ));
    return  GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Savoniq",
          defaultTransition: Transition.downToUp,
          theme: AppThemes.themeData,
           initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
        );
  }}


