import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tin_flutter_book/common/entity/books.dart';
import 'package:tin_flutter_book/common/widgets/toast.dart';

import '../../common/api/apis.dart';
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

  Future<void>  getDownloadBookInfo() async{
    var response =await CsgAPI.downloadBook(
        bookId: state.book.bookId.toString()
    );

    if(response.code==0){
      DownloadBook book=response.data;
      book.bookCover=state.book.bookCovers![0].toString();
      final insertedId = await DatabaseHelper().insertBookData(book);
      toastInfo(msg: "加入书架成功");
      Get.back();
      logPrint('加入书架成功 ID: $insertedId');
    }else{
      toastInfo(msg: "${response.msg}");
    }

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
