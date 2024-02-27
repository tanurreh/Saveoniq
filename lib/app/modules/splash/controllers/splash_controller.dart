
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {

  final box = GetStorage();

  @override
  void onReady() async {
    await Future.delayed(const Duration(milliseconds: 3000)).then((value) {
      
     bool? isShow =  box.read('showTermsAndCond');
      if(isShow != null){
        Get.toNamed(Routes.LANDING);
      }else{
      Get.toNamed(Routes.TERMSANDCONDITION);
      }
    });  
  }


}
