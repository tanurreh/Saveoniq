import 'package:get/get.dart';

class TermsandconditionController extends GetxController {


 bool isCheck = false;

 void changeCheck (){
  isCheck = !isCheck;
  update();
 }
}
