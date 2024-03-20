// ignore_for_file: prefer_typing_uninitialized_variables

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
  final searchController = TextEditingController();

  bool isSearchLoading = true;
  void changeSearchLoading() {
    isSearchLoading = isSearchLoading;
    update();
  }

  bool isError = false;

  void changeIsError() {
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

  File? myFile;
  void setFile(File downFile) {
    myFile = downFile;
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
      changeIsError();
    } catch (e) {
      Fluttertoast.showToast(msg: 'An error occurred while getting video');

      log('an error occurred in getLinksData ❤❤❤❤ $e');
    } finally {
      _isLoading = false;
      update();
    }
  }

  //Download media
  Future<void> downloadMedia(
    String title,
  ) async {
    //  final Directory output = await getTemporaryDirectory();
    //                         final String newFilePath = '${output.path}/newfile.mp4';
    //                         File? sendedfile = File(newFilePath);
    final url = _siteModel.links[0].link;
    File? downloadedFile = await FileDownloader.downloadFile(
      url: url,
      name: title.trim().replaceAll(' ', ''), 
      notificationType: NotificationType.all,
      onProgress: (String? text, double value) {
        changePercentage(value);
      },
      onDownloadCompleted: (path) {
        hideProgressDialog();
        showDownloadDialog(
            message: siteModel.title.toString(),
            downloadUrl: siteModel.thumbnail,
            onClose: () {
              Get.back();
              onDownloadClose();
            },
            path: path);
      },
      onDownloadError: (errorMessage) {
        Fluttertoast.showToast(msg: errorMessage);
      },
    );
    if (downloadedFile != null) {
      setFile(downloadedFile);
      log(downloadedFile.path);
      Fluttertoast.showToast(msg: 'File Downloaded');
    } else {
      Fluttertoast.showToast(msg: 'File is null');
    }
  }

  getFileData() async {
    log('Getting file data from controller ${myFile.toString()}');
    return await myFile!.readAsBytes();
  }

  void onDownloadClose() {
    changeIsError();
    toggleLoading(false);
    _siteModel = null;
    _percentage = 0.0;
    searchController.clear();
    update();
  }
}
