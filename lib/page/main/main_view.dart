import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../common/entity/books.dart';
import '../../common/values/values.dart';
import '../../common/widgets/widgets.dart';
import 'main_logic.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final logic = Get.put(MainLogic());

  final state = Get.find<MainLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: transparentAppBar(
          title: const Text("登录"),
          actions:<Widget>[
            IconButton(
              icon: const Icon(
                Icons.refresh,
                color: AppColors.primaryText,
              ),
              onPressed: () {
                logic.onRefresh();
              },
            ),
          ] ),
      backgroundColor: Colors.white,
      body: Container(
        child: GetX<MainLogic>(
          init: logic,
          initState: (_) {},
          builder: (logic) {
            return SmartRefresher(
              controller: logic.refreshController,
              onRefresh: logic.onRefresh,
              onLoading: logic.onLoading,
              child: GridView.builder(
                  itemCount: state.newsList.length,
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    //网格代理：定交叉轴数目
                    crossAxisCount: 2, //条目个数
                    mainAxisSpacing: 0, //主轴间距
                    crossAxisSpacing: 0, //交叉轴间距
                    // childAspectRatio: 1 / 0.618,
                  ),
                  itemBuilder: (_, int position) =>
                      _builtItem(state.newsList[position])),
            );
          },
        ),
      ),
    );
  }

  Widget _builtItem(BooksVo book) {
    var width = (ScreenUtil.defaultSize.width - 5) / 2;
    var imgHeight = width / 0.75;

    return GestureDetector(
      onTap: () {
        // AppNavigator.pushNovelDetail(context, novel);
      },
      child: Container(
        color: AppColors.orange,
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            netImageCached(
              book.cover.toString(),
              width: width,
              fit: width < imgHeight ? BoxFit.fitHeight : BoxFit.fitWidth,
              height: imgHeight,
            ),
            const SizedBox(height: 5),
            Text(
              book.name.toString(),
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              maxLines: 1,
            ),
            const SizedBox(height: 3),
            Text(
              book.name.toString(),
              style:
                  const TextStyle(fontSize: 12, color: AppColors.borderColor),
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
