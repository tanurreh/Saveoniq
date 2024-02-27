import 'package:get/get.dart';

class SettingsController extends GetxController {

   bool showNotification = true;

   void changeShowNotification (){
    showNotification =  !showNotification;
    update();
   }
}
