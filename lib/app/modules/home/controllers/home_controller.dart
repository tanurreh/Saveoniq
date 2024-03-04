// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'dart:developer';
import 'dart:io';

import 'package:direct_link/direct_link.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:savoniq/app/modules/home/model/get_video_model.dart';
import 'package:savoniq/app/modules/home/widgets/download_dialog.dart';
import 'package:savoniq/app/modules/home/widgets/progress_bar_dialog.dart';

class HomeController extends GetxController {
  final searchController = TextEditingController();
  final dio = Dio();

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
    update();
  }

  double _percentage = 0.0;
  double get percentage => _percentage;

  void changePercentage(double value) {
    _percentage = value;
    update();
  }

  GetVideoModel? _video;
  GetVideoModel? get video => _video;


 void onSearch (String url) async {
  toggleLoading(true);
  _video = await getVideoLink(url);
  toggleLoading(false);
  if(_video != null ){
    changeIsError();
  }
  update();
 }

  Future<GetVideoModel?> getVideoLink(String url) async {
   try {
      final response = await dio.post('https://getpreview-5tbmt3daaa-uc.a.run.app',
      queryParameters: {
        "url": url
      },
      options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization":
                "Bearer 8168fae4-da9c-43c0-858d-48cfd0ed220b",
          })
      
      );

      print(response.statusCode);
      if (response.statusCode == 200) {
        print(jsonEncode(response.data));
       GetVideoModel result = GetVideoModel.fromJson(jsonEncode(response.data));
        print(result);
        return result;
      }
      return null;
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString(),
      toastLength: Toast.LENGTH_LONG,
      );
      return null;
    }
  }



 //download file
//  Future<void> downloadFile(
//       String url, String fileName, String extension) async {
//     var dio = new Dio();
//     var dir = await getExternalStorageDirectory();
//     var downloadDir =
//         await Directory('${dir?.path}/downloads').create(recursive: true);
//     File('${downloadDir.path}/$fileName.$extension').exists().then((a) async {
//       print(a);
//       if (a) {
//         print("File already downloaded");
//       } else {
//         await dio.download(url, '${downloadDir.path}/$fileName.$extension',
//             onReceiveProgress: (rec, total) {
//            var progressValue = (rec / total);
//             changePercentage(progressValue);
//         });
//       }
//     });
//   }
  //getlinkdata

  // final _directLink = DirectLink();
  // var _siteModel;
  // get siteModel => _siteModel;

  // //function
  // Future<void> getLinksData(String url) async {
  //   try {
  //     _isLoading = true;
  //     update();

  //     _siteModel = await _directLink.check(url);
  //     if (siteModel?.title.toString() == 'null') {
  //       Fluttertoast.showToast(
  //         msg: 'Please wait while we fetch Data',
  //       );

  //       for (int i = 1; i < 4; i++) {
  //         if (siteModel?.title.toString() == 'null') {
  //           log('🙌🙌 title is null so checking $i');

  //           _siteModel = await _directLink.check(url); // again checking
  //         } else {
  //           log('i contain value so returning from loop🌹🌹🌹');
  //           break;
  //         }
  //       }
  //     }
  //      changeIsError();
  //   } catch (e) {
  //     Fluttertoast.showToast(msg: 'An error occurred while getting video');

  //     log('an error occurred in getLinksData ❤❤❤❤ $e');
  //   } finally {
  //     _isLoading = false;
  //     update();
  //   }
  // }

  //Download media
  Future<void> downloadMedia(String title,) async {
    //  final Directory output = await getTemporaryDirectory();
    //                         final String newFilePath = '${output.path}/newfile.mp4';
    //                         File? sendedfile = File(newFilePath);
    final url = _video!.url!;
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
            message: _video!.title!,
            downloadUrl: _video!.images![0],
            onClose: (){
               Get.back();
            onDownloadClose();
            } , path: path);
      },
      onDownloadError: (errorMessage) {
        Fluttertoast.showToast(msg: errorMessage);
      },
    );
    if(downloadedFile != null){
    setFile(downloadedFile);
      Fluttertoast.showToast(msg: 'File Downloaded');
    }else {
      Fluttertoast.showToast(msg: 'File is null');
    }
  }

  void onDownloadClose() {
    changeIsError();
    toggleLoading(false);
    //_siteModel = null;
    _percentage = 0.0;
    searchController.clear();
    update();
  }
}
