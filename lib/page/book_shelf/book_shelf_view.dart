
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tin_flutter_book/common/values/values.dart';

import '../../common/entity/books.dart';
import '../../common/style/style.dart';
import '../../common/widgets/widgets.dart';
import 'book_shelf_logic.dart';

class BookShelfPage extends StatelessWidget {
  final logic = Get.put(BookShelfLogic());
  final state = Get.find<BookShelfLogic>().state;

  BookShelfPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: transparentAppBar(title: AStrings.shelf),
      body: GetX<BookShelfLogic>(
        init: logic,
        initState: (_) {},
        builder: (logic) {
          return SmartRefresher(
            controller: logic.refreshController,
            onRefresh: logic.onRefresh,
            enablePullDown: true,
            enablePullUp: false,
            physics: const BouncingScrollPhysics(),
            child: GridView.builder(
                itemCount: state.books.length,
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
                    _builtGridViewItem(state.books[position])),
          );
        },
      ),
    );
  }

  Widget _builtGridViewItem(DownloadBook book) {
    return GestureDetector(
      onTap: () {
        logic.openOrDownloadBook(book);
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
              _buildBook(book),
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


  Widget _buildBook(DownloadBook? book) {
    return Container(
      width: ScreenUtil().screenWidth / 3,
      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          DecoratedBox(
            decoration: DecorationStyle.bookDecoration(),
            child: netImageCached(
              book?.bookCover,
              radius: Dimens.bookCoverRadius,
              width: Dimens.bookWidth,
              height: Dimens.bookHeight,
            ),
          ),
           Center(child: Visibility(
            child: CircularProgressIndicator(
              strokeCap: StrokeCap.round,
              backgroundColor: AppColors.progressBg,
              color: AppColors.progressValue,
              value: book!.downloadProgress,
            ),
          ),
          ),
        ],
      ),
    );
  }




}
