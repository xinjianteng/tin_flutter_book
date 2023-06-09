import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common/values/values.dart';
import '../../common/widgets/widgets.dart';
import '../main/main_view.dart';
import 'application_logic.dart';

class ApplicationPage extends StatelessWidget {

  final logic = Get.put(ApplicationLogic());
  final state = Get.find<ApplicationLogic>().state;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }



  // 顶部导航
  AppBar _buildAppBar() {
    return transparentAppBar(
        title: Obx(() => Text(
          logic.state.tabTitles[state.page],
          style: TextStyle(
            color: AppColors.primaryText,
            fontFamily: 'Montserrat',
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        )),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
              color: AppColors.primaryText,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.refresh,
              color: AppColors.primaryText,
            ),
            onPressed: () {

            },
          )
        ]);
  }

  // 内容页
  Widget _buildPageView() {
    return PageView(
      // physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        MainPage(),
        // CategoryPage(),
        const Text('BookmarksPage'),
        const Text('BookmarksPage'),
        const Text('AccountPage'),
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
