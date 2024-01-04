import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tin_flutter_book/common/utils/utils.dart';

import '../../common/api/apis.dart';
import '../../common/entity/entities.dart';
import '../../common/entity/page.dart';
import 'main_state.dart';

class MainLogic extends GetxController {
  final MainState state = MainState();

  /// UI 组件
  final RefreshController refreshController = RefreshController(
    initialRefresh: true,
  );

  late ScrollController scrollController;




  @override
  void onInit() {
    // TODO: implement onInit
    scrollController = ScrollController(keepScrollOffset: true);

    super.onInit();
  }




  void onTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  /// 响应式成员变量
  /// 成员变量
  String categoryCode = '';
  int curPage = 1;
  int pageSize = 30;
  int total = 30;



  /// 事件
  void onRefresh() async{
    curPage = 1;
    fetchNewsList(isRefresh: true).then((_) {
      refreshController.refreshCompleted();
    }).catchError((_) {
      refreshController.refreshFailed();
    });
  }

  void onLoading() async{
    if (state.newsList.length < total) {
      fetchNewsList().then((_) {
        refreshController.loadComplete();
      }).catchError((_) {
        refreshController.loadFailed();
      });
    } else {
      refreshController.loadNoData();
    }
  }

  // 方法

  // 拉取数据
  Future<void> fetchNewsList({bool isRefresh = false}) async {
    var response =await CsgAPI.getBooks(
      params: PageListRequestEntity(
          size: pageSize.toString(),
          current: curPage.toString(),
      ),
    );
    if (isRefresh == true) {
      total = response.data!.total;
      state.newsList.clear();
    }
    curPage++;
    state.newsList.addAll(response.data!.records);
    update();
  }


  Future<void>  getDownloadBookInfo(UploadBook uploadBook) async{
    var response =await CsgAPI.downloadBook(
      params: uploadBook
    );

    writeString("ssss");

    HttpUtil().downloadFile(response.data!.downloadUrl, _getLocalDocumentFile());

    log(response.toString());
  }


  /// 获取文档目录文件
  Future<File> _getLocalDocumentFile() async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/str.txt');
  }

  /// 获取临时目录文件
  Future<File> _getLocalTemporaryFile() async {
    final dir = await getTemporaryDirectory();
    return File('${dir.path}/str.txt');
  }

  /// 获取应用程序目录文件
  Future<File> _getLocalSupportFile() async {
    final dir = await getApplicationSupportDirectory();
    return File('${dir.path}/str.txt');
  }

  /// 读取值
  Future<void> readString() async {
    try {

      final file = await _getLocalDocumentFile();
      final result  = await file.readAsString();
      print("result-----$result");

      final file1 = await _getLocalTemporaryFile();
      final result1  = await file1.readAsString();
      print("result1-----$result1");

      final file2 = await _getLocalSupportFile();
      final result2  = await file2.readAsString();
      print("result2-----$result2");


    } catch (e) {
    }
  }

  /// 写入数据
  Future<void> writeString(String str) async {
    final file = await _getLocalDocumentFile();
    await file.writeAsString(str);

    final file1 = await _getLocalTemporaryFile();
    await file1.writeAsString(str);

    final file2 = await _getLocalSupportFile();
    await file2.writeAsString(str);
    print("写入成功");
  }


}
