// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:savoniq/app/core/globals/loader_enum.dart';
import 'package:savoniq/app/core/model/model.dart';
import 'package:savoniq/app/modules/home/widgets/download_dialog.dart';
import 'package:savoniq/app/modules/home/widgets/loading_indicator.dart';
import 'package:savoniq/app/modules/home/widgets/progress_bar_dialog.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  final searchController = TextEditingController();
  Loader currentState = Loader.start;

  void changeLoaderState(Loader value) {
    currentState = value;
    update();
  }

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

  void toggleLoading(loading) {
    _isLoading = loading;
    update();
  }

  File? myFile;
  void setFile(File downFile) {
    myFile = downFile;
    log(myFile!.path);
    update();
  }

  double _percentage = 0.0;
  double get percentage => _percentage;

  void changePercentage(double value) {
    _percentage = value;
    update();
  }

  //getlinkdata
  GetLinkModel? linkResponse;
  VideoDataModel? videoData;

  Future<void> getVideoData(String downloadUrl) async {
    changeLoaderState(Loader.loading);
    videoData = await getVideoResponse(downloadUrl);
    update();
    if (videoData != null) {
      changeLoaderState(Loader.preview);
    } else {
      changeLoaderState(Loader.error);
    }
  }

  Future<VideoDataModel?> getVideoResponse(String downloadUrl) async {
    try {
      log(downloadUrl.toString());
      String url =
          'https://getpreview-5tbmt3daaa-uc.a.run.app?url=$downloadUrl';
      log(url.toString());
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer 8168fae4-da9c-43c0-858d-48cfd0ed220b',
          'Content-Type': 'application/json',
        },
      );
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        return VideoDataModel.fromJson(response.body);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
       Fluttertoast.showToast(msg: e.toString());
    }
    return null;
  }

  Future<void> downloadVideo(String downloadUrl) async {
    await Get.showOverlay(
      asyncFunction: () async {
        linkResponse = await _fetchLink(downloadUrl);
        update();
      },
      loadingWidget: LoadingIndicator().loadingIndicator,
    );
    if (linkResponse != null && linkResponse!.url.isURL) {
      showProgressDialog(message: percentage.toString(), value: percentage);
      await downloadMedia(
        videoData!.title!,
        linkResponse!.url,
      );
       Future.delayed(const Duration(milliseconds: 6000), () {
       showDownloadDialog(
            message: videoData!.title!.toString(),
            downloadUrl: videoData!.images![0],
            onClose: () {
              Get.back();
              onDownloadClose();
            },
            path: myFile!.path);});
    } else {
      Fluttertoast.showToast(msg: 'Something went wrong, Unable to download');
    }
  }

  Future<GetLinkModel?> _fetchLink(String downloadUrl) async {
    try {
      log(downloadUrl.toString());
      String url =
          'https://getdownloadlink-5tbmt3daaa-uc.a.run.app?url=$downloadUrl';
      log(url.toString());
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer 8168fae4-da9c-43c0-858d-48cfd0ed220b',
          'Content-Type': 'application/json',
        },
      );
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        log(response.body.toString());
        return GetLinkModel.fromJson(response.body);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      log(e.toString());
       Fluttertoast.showToast(msg: e.toString());
    }
    return null;
  }

  //Download media
  Future<void> downloadMedia(
    String title,
    String url,
  ) async {
    File? downloadedFile = await FileDownloader.downloadFile(
      url: url,
      name: title.trim().replaceAll(' ', ''),
      notificationType: NotificationType.all,
      onProgress: (String? text, double value) {
        changePercentage(value);
      },
      onDownloadCompleted: (path) async {
     hideProgressDialog();
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
    linkResponse = null;
    videoData = null;
    changeLoaderState(Loader.start);
    _percentage = 0.0;
    searchController.clear();
    update();
  }
}
