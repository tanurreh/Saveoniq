import 'package:get/get.dart';

import '../controllers/termsandcondition_controller.dart';

class TermsandconditionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TermsandconditionController>(
      () => TermsandconditionController(),
    );
  }
}
