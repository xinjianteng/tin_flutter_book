import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tin_flutter_book/page/mine/mine_view.dart';

import '../../common/values/values.dart';
import '../book_main/book_main_view.dart';
import '../book_shelf/book_shelf_view.dart';
import 'application_logic.dart';

class ApplicationPage extends StatelessWidget {
  final logic = Get.put(ApplicationLogic());
  final state = Get
      .find<ApplicationLogic>()
      .state;

  ApplicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: _buildPageView(),
      // bottomNavigationBar: _buildBottomNavigationBar(),
      body: Obx(() {
        return IndexedStack(
          children: <Widget>[
            BookMainPage(),
            BookShelfPage(),
            MinePage(),
          ],
          index: state.page,
        );
      }),

      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.white,
        // activeColor: SQColor.primary,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: getTabIcon(0), label: '书架'),
          BottomNavigationBarItem(icon: getTabIcon(1), label: '书城'),
          BottomNavigationBarItem(icon: getTabIcon(2), label: '我的'),
        ],
        currentIndex: state.page,
        onTap: (index) {
          state.page = index;
        },
      ),
    );
  }


  Image getTabIcon(int index) {
    if (index == state.page) {
      return state.tabSelectedImages[index];
    } else {
      return state.tabImages[index];
    }
  }

  // 内容页
  Widget _buildPageView() {
    return Obx(() {
      return PageView(
        // physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          BookMainPage(),
          BookShelfPage(),
          Text('BookmarksPage'),
          MinePage(),
        ],
        controller: logic.pageController,
        onPageChanged: logic.handlePageChanged,
      );
    });
  }

  // 底部导航
  Widget _buildBottomNavigationBar() {
    return Obx(() =>
        BottomNavigationBar(
          items: logic.bottomTabs.value,
          currentIndex: logic.state.page,
          type: BottomNavigationBarType.fixed,
          onTap: logic.handleNavBarTap,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ));
  }
}
