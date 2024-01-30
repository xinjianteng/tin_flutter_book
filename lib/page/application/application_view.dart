import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common/values/values.dart';
import '../../common/widgets/widgets.dart';
import '../book_main/book_main_view.dart';
import '../book_shelf/book_shelf_view.dart';
import '../main/main_view.dart';
import 'application_logic.dart';

class ApplicationPage extends StatelessWidget {

  final logic = Get.put(ApplicationLogic());
  final state = Get.find<ApplicationLogic>().state;

   ApplicationPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }


  // 内容页
  Widget _buildPageView() {
    return PageView(
      // physics: const NeverScrollableScrollPhysics(),
      children:  <Widget>[
        BookMainPage(),
        BookShelfPage(),
        Text('BookmarksPage'),
        Text('AccountPage'),
      ],
      controller: logic.pageController,
      onPageChanged: logic.handlePageChanged,
    );
  }

  // 底部导航
  Widget _buildBottomNavigationBar() {
    return Obx(() => BottomNavigationBar(
      items: logic.bottomTabs,
      currentIndex: logic.state.page,
      // fixedColor: AppColors.primaryElement,
      type: BottomNavigationBarType.fixed,
      onTap: logic.handleNavBarTap,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ));
  }
}
