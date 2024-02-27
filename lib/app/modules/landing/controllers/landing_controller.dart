import 'package:savoniq/app/modules/home/views/home_view.dart';
import 'package:savoniq/app/modules/settings/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingController extends GetxController {

 int currentIndex = 0;

 void changeCurrentIndex(int value) {
  currentIndex = value;
  update();
 }

 List<Widget> screens =   [
  HomeView(),
  const SettingsView()
 ];

}
