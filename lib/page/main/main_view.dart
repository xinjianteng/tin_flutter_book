import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../common/entity/books.dart';
import '../../common/style/style.dart';
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
      appBar: transparentAppBar(title: '书库', actions: [
        IconButton(
          onPressed: () {
            // logic.switchViewStyle();
          },
          icon: const Icon(Icons.grid_view_sharp),
        ),
      ]),
      body: GetX<MainLogic>(
        init: logic,
        initState: (_) {},
        builder: (logic) {
          return SmartRefresher(
            controller: logic.refreshController,
            onRefresh: logic.onRefresh,
            onLoading: logic.onLoading,
            enablePullDown: true,
            enablePullUp: true,
            // physics: const AlwaysScrollableScrollPhysics(),
            physics: const BouncingScrollPhysics(),
            // physics: const ClampingScrollPhysics (),
            // physics: const NeverScrollableScrollPhysics (),
            header: const ClassicHeader(
              //无特殊要求就可以用这个换下文案就行了
              height: 45.0,
              releaseText: '松开刷新',
              refreshingText: '刷新中',
              completeText: '刷新完成',
              idleText: '下拉刷新',
            ),
            footer: const ClassicFooter(
              //无特殊要求就可以用这个换下文案就行了
              loadStyle: LoadStyle.ShowWhenLoading,
              completeDuration: Duration(microseconds: 50),
              canLoadingText: '松开刷新',
              noDataText: '没有更多数据啦',
              loadingText: '刷新中',
              idleText: '上拉加载',
            ),
            child: ListView.builder(
              itemBuilder: (c, i) => Card(
                elevation: 4,
                child: _builtListItem(state.newsList[i]),
              ),
              itemCount: state.newsList.length,
            ),

            // child: GridView.builder(
            //     itemCount: state.newsList.length,
            //     scrollDirection: Axis.vertical,
            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //       //网格代理：定交叉轴数目
            //       crossAxisCount: state.crossAxisCount, //条目个数
            //       mainAxisSpacing: 0, //主轴间距
            //       crossAxisSpacing: 0, //交叉轴间距
            //       // childAspectRatio: 1 / 0.618,
            //     ),
            //     itemBuilder: (_, int position) =>
            //         _builtGridViewItem(state.newsList[position])),
          );
        },
      ),
    );
  }

  Widget _builtListItem(UploadBook book) {
    return GestureDetector(
      onTap: () {
        // AppNavigator.pushNovelDetail(context, novel);
        logic.getDownloadBookInfo(book);
      },
      child: Container(
        width: ScreenUtil().screenWidth,
        height: Dimens.bookHeight + Dimens.margin,
        margin: EdgeInsets.all(Dimens.margin),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              bottom: 0,
              child: _buildBookCover(book.bookCovers![0].toString()),
            ),
            Positioned(
              left: Dimens.bookWidth + Dimens.space,
              right: 0,
              top: Dimens.margin,
              child: Text(
                '${book.bookName}',
                style: TextStyleUnit.bookNameStyle(),
              ),
            ),
            Positioned(
              bottom: Dimens.margin,
              right: 0,
              left: Dimens.bookWidth + Dimens.space,
              child: Text(
                '${book.bookAuthor}',
                style: TextStyleUnit.bookNameStyle(),
              ),
            ),
          ],
        ),
      ),
    );
  }





  Widget _builtGridViewItem(UploadBook book) {

    return GestureDetector(
      onTap: () {
        // AppNavigator.pushNovelDetail(context, novel);
        logic.getDownloadBookInfo(book);
      },
      child: Container(
        margin: EdgeInsets.all(Dimens.space),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              bottom: 0,
              child: _buildBookCover(book.bookCovers![0].toString()),
            ),
            Positioned(
              left: Dimens.bookWidth + Dimens.space,
              right: 0,
              top: Dimens.margin,
              child: Text(
                '${book.bookName}',
                style: TextStyleUnit.bookNameStyle(),
              ),
            ),
            Positioned(
              bottom: Dimens.margin,
              right: 0,
              left: Dimens.bookWidth + Dimens.space,
              child: Text(
                '${book.bookAuthor}',
                style: TextStyleUnit.bookNameStyle(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookCover(String cover) {
    return DecoratedBox(
      decoration: DecorationStyle.bookDecoration(),
      child: netImageCached(
        cover,
        radius: Dimens.bookCoverRadius,
        width: Dimens.bookWidth,
        height: Dimens.bookHeight,
      ),
    );
  }
}
