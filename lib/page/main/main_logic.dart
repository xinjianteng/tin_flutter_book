import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../common/api/apis.dart';
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
  void onRefresh() {
    curPage = 1;
    fetchNewsList(isRefresh: true).then((_) {
      refreshController.refreshCompleted();
    }).catchError((_) {
      refreshController.refreshFailed();
    });
  }

  void onLoading() {
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
      // total = response.count;
      state.newsList.clear();
    }
    curPage++;
    // state.newsList.addAll(response.results!);
    update();
  }



}
