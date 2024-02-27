import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'dart:developer';
import 'dart:io';

import 'package:direct_link/direct_link.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:savoniq/app/modules/home/widgets/download_dialog.dart';
import 'package:savoniq/app/modules/home/widgets/progress_bar_dialog.dart';

class HomeController extends GetxController {
  bool isSearchLoading = true;
  final searchController = TextEditingController();

  void changeSearchLoading() {
    isSearchLoading = isSearchLoading;
    update();
  }

  bool isError = false;
   void changeIsError(){
        isError = !isError;
        update();
   }

  bool isSearchIcon = false;

  void changeIsSearch() {
    isSearchIcon = isSearchIcon;
    update();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  final _directLink = DirectLink();
  var _siteModel;
  get siteModel => _siteModel;

  void toggleLoading(loading) {
    _isLoading = loading;
    update();
  }

  double _percentage = 0.0;
  double get percentage => _percentage;

  void changePercentage(double value) {
    _percentage = value;
    update();
  }

  //getlinkdata
  Future<void> getLinksData(String url) async {
    try {
      _isLoading = true;
      update();

      _siteModel = await _directLink.check(url);
      if (siteModel?.title.toString() == 'null') {
        Fluttertoast.showToast(
          msg: 'Please wait while we fetch Data',
        );

        for (int i = 1; i < 4; i++) {
          if (siteModel?.title.toString() == 'null') {
            log('🙌🙌 title is null so checking $i');

            _siteModel = await _directLink.check(url); // again checking
          } else {
            log('i contain value so returning from loop🌹🌹🌹');
            break;
          }
        }
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'An error occurred while getting video');
      changeIsError();
      toggleLoading(false);
      log('an error occurred in getLinksData ❤❤❤❤ $e');
    } finally {
      _isLoading = false;
      update();
    }
  }

  //Download media
  Future<void> downloadMedia(String title,) async {
    final url = _siteModel.links[0].link;
    File? downloadedFile = await FileDownloader.downloadFile(
      url: url,
      name: title,
      notificationType: NotificationType.all,
      onProgress: (String? text, double value) {
       
        changePercentage(value);
      },
      onDownloadCompleted: (path) {
        hideProgressDialog();
        showDownloadDialog(
            message: siteModel.title.toString(),
            downloadUrl: siteModel.thumbnail,
            onClose: onDownloadClose, path: path);
      },
      onDownloadError: (errorMessage) {
        Fluttertoast.showToast(msg: errorMessage);
      },
    );

    print('😍😍😍😍 file path is  : : : ${downloadedFile?.path}');
  }

  void onDownloadClose() {
    toggleLoading(false);
    _siteModel = null;
     _percentage = 0.0;
     searchController.clear();
    update();
    Get.back();
   
  }
}
