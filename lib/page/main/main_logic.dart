import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../common/api/books_api.dart';
import '../../common/entity/page.dart';
import 'main_state.dart';

class MainLogic extends GetxController {
  final MainState state = MainState();

  /// UI 组件
  final RefreshController refreshController = RefreshController(
    initialRefresh: true,
  );

  late ScrollController scrollController;

  // final WidgetRepository repository = WidgetDbRepository();

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
  int curPage = 0;
  int pageSize = 20;
  int total = 20;



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
    var response =await BooksAPI.bookPageList(
      params: PageListRequestEntity(
          limit: pageSize.toString(),
          skip: curPage.toString(),
          count: '1',
          order: "updatedAt"
      ),
      cacheDisk: true,
    );
    if (isRefresh == true) {
      total = response.count;
      state.newsList.clear();
    }
    curPage++;
    state.newsList.addAll(response.results!);
    update();
  }



}
