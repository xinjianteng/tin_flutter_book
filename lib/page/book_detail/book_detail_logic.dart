import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tin_flutter_book/common/entity/books.dart';
import 'package:tin_flutter_book/common/utils/logger_util.dart';
import 'package:tin_flutter_book/common/widgets/toast.dart';

import '../../common/api/apis.dart';
import '../../common/utils/DatabaseHelper.dart';
import '../../common/utils/app_utils.dart';
import '../../common/utils/utils.dart';
import 'book_detail_state.dart';

class BookDetailLogic extends GetxController {
  final BookDetailState state = BookDetailState();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }


  void checkPermission() async {
    // 请求存储权限
    final permissionState = await getStoragePermission();
    if (permissionState) {
      // 权限被授予
      getDownloadBookInfo();
    } else {
      // 权限被拒绝 打开手机上该App的权限设置页面
      openAppSettings();
    }
  }

  addShelf(){


  }


  Future<void>  getDownloadBookInfo() async{
    var response =await CsgAPI.downloadBook(
        bookId: state.bookId.value
    );

    if(response.code==0){
      final dbHelper = DatabaseHelper();
      final insertedId = await dbHelper.insertBookData(response.data);
      print('Inserted record with ID: $insertedId');
    }else{
      toastInfo(msg: "${response.msg}");
    }

    // final downloadDir = await AppUtils().getDownloadPath();
    //
    // var responseDownload=  HttpUtil().downloadFile(response.data!.downloadUrl, downloadDir,  onReceiveProgress: (int count, int total) {
    //   //进度
    //   logPrint("$count $total");
    // });
    // 调用带有回调的方法

  }






  /// 获取存储权限
  Future<bool> getStoragePermission() async {
    late PermissionStatus myPermission;
    /// 读取系统权限
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      myPermission = await Permission.photosAddOnly.request();
    } else {
      myPermission = await Permission.storage.request();
    }
    if (myPermission != PermissionStatus.granted) {
      return false;
    } else {
      return true;
    }
  }



}
