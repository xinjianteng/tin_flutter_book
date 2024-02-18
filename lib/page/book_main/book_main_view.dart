import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tin_flutter_book/common/routers/names.dart';

import '../../common/entity/books.dart';
import '../../common/style/style.dart';
import '../../common/values/values.dart';
import '../../common/widgets/widgets.dart';
import 'book_main_logic.dart';

class BookMainPage extends StatelessWidget {
  final logic = Get.put(BookMainLogic());
  final state = Get.find<BookMainLogic>().state;

  BookMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: transparentAppBar(title: AStrings.cloudBook, actions: [
        IconButton(
          onPressed: () {
            // logic.switchViewStyle();
          },
          icon: const Icon(Icons.grid_view_sharp),
        ),
      ]),
      backgroundColor: AppColors.white,
      body: GetX<BookMainLogic>(
        init: logic,
        initState: (_) {},
        builder: (logic) {
          return SmartRefresher(
            controller: logic.refreshController,
            onRefresh: logic.onRefresh,
            onLoading: logic.onLoading,
            enablePullDown: true,
            enablePullUp: true,
            physics: const BouncingScrollPhysics(),
            child: GridView.builder(
                itemCount: state.newsList.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                // 允许GridView适应其子控件大小
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  //网格代理：定交叉轴数目
                  crossAxisCount: 3, //条目个数
                  crossAxisSpacing: 0.1,
                  mainAxisSpacing: 0,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (_, int position) =>
                    _builtGridViewItem(state.newsList[position])),
          );
        },
      ),
    );
  }

  Widget _builtGridViewItem(UploadBook book) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.bookDetail, arguments: book);
      },
      child: Container(
        color: AppColors.line,
        padding: const EdgeInsets.all(0.1),
        alignment: Alignment.topCenter,
        child: Container(
          color: AppColors.white,
          width: ScreenUtil().screenWidth / 3,
          padding: EdgeInsets.only(top: 10.h),
          child: Column(
            children: [
              _buildBookCover(book.bookCovers![0].toString()),
              Text(
                '${book.bookName}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyleUnit.bookNameStyle(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBookCover(String coverPath) {
    return Container(
      width: ScreenUtil().screenWidth / 3,
      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0),
      child: DecoratedBox(
        decoration: DecorationStyle.bookDecoration(),
        child: netImageCached(
          coverPath,
          radius: Dimens.bookCoverRadius,
          width: Dimens.bookWidth,
          height: Dimens.bookHeight,
        ),
      ),
    );
  }
}
