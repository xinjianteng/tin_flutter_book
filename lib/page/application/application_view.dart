import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tin_flutter_book/page/book_group/book_group_view.dart';
import 'package:tin_flutter_book/page/mine/mine_view.dart';
import 'package:tin_flutter_book/page/book_main/book_main_view.dart';
import 'package:tin_flutter_book/page/book_shelf/book_shelf_view.dart';
import '../../common/values/values.dart';
import 'application_logic.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  _ApplicationPageState createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  final logic = Get.put(ApplicationLogic());
  final state = Get.find<ApplicationLogic>().state;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: state.page,
          children: [
            const BookGroupPage(),
            BookShelfPage(),
            MinePage(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => CupertinoTabBar(
          backgroundColor: Colors.white,
          activeColor: AppColors.btn,
          items: [
            BottomNavigationBarItem(icon: getTabIcon(0), label: '首页'),
            BottomNavigationBarItem(icon: getTabIcon(1), label: '书桌'),
            BottomNavigationBarItem(icon: getTabIcon(2), label: '我的'),
          ],
          currentIndex: state.page,
          onTap: (index) {
            state.page = index;
          },
        ),
      ),
    );
  }

  Image getTabIcon(int index) {
    return state.page == index ? state.tabSelectedImages[index] : state.tabImages[index];
  }
}
