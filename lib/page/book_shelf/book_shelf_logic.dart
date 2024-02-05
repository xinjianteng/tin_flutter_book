import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tin_flutter_book/common/entity/books.dart';
import 'package:tin_flutter_book/common/utils/DatabaseHelper.dart';

import '../../common/utils/app_utils.dart';
import '../../common/utils/utils.dart';
import 'book_shelf_state.dart';

class BookShelfLogic extends GetxController {
  final BookShelfState state = BookShelfState();

  /// UI 组件
  final RefreshController refreshController = RefreshController(
    initialRefresh: true,
  );

  late ScrollController scrollController;

  /// 事件
  void onRefresh() async {
    fetchNewsList().then((_) {
      refreshController.refreshCompleted();
    }).catchError((_) {
      refreshController.refreshFailed();
    });
  }

  // 拉取数据
  Future<void> fetchNewsList({bool isRefresh = false}) async {
    final result = await DatabaseHelper().getShelfBookData();
    state.books.clear();
    state.books.addAll(result);
    update();
  }

  //打开或者下载图书
  void openOrDownloadBook(DownloadBook book) async {
    book
        .localFilesExists()
        .then((value) => {value ? openBook(book) : downloadBook(book)});
  }

//  打开图书
  void openBook(DownloadBook book) {}

//  下载图书
  void downloadBook(DownloadBook book) async {
    final downloadDir = await AppUtils().getDownloadPath();

    HttpUtil()
        .downloadFile(book.downloadUrl, downloadDir,
            onReceiveProgress: (int count, int total) {
      //进度
      logPrint("$count $total");
      if(count==total){

      }

      for (int i = 0; i < state.books.value.length; i++) {
        final bookTmp = state.books.value[i];
        if(book.bookId==bookTmp.bookId){
          state.books.value[i].downloadProgress=count/total;
        }
      }
      update();
    });
  }


  // 更新列表中指定位置的item的title
  void updateItemAt(int index, String newTitle,double value) {
    if (index >= 0 && index < state.books.length) {
      final item = state.books[index];
      item.downloadProgress = value; // 直接修改对应item的title值
    }
  }


}
