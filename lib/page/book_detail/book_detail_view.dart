import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common/style/style.dart';
import '../../common/values/values.dart';
import '../../common/widgets/widgets.dart';
import 'book_detail_logic.dart';

class BookDetailPage extends StatelessWidget {
  final logic = Get.put(BookDetailLogic());
  final state = Get.find<BookDetailLogic>().state;

  BookDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        titleWidget: const Text(AStrings.bookInfo),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      color: AppColors.appBg,
      width: ScreenUtil().screenWidth,
      child: Stack(
        children: [
          Positioned(
            left: 16.w,
            top: 16.h,
            child: _buildBookCover(),
          ),
          Positioned(
            left: 16.w + Dimens.bookWidthMAX + 12.w,
            top: 16.h,
            right: 0.h,
            child: _buildBookName(),
          ),
          Positioned(
            left: 16.w + Dimens.bookWidthMAX + 12.w,
            top: 86.h,
            right: 0.h,
            child: _buildBookAuthor(),
          ),
          Positioned(
            left: 16.w,
            right: 16.h,
            bottom: 16.h,
            child: buildBtn(
              title: AStrings.download,
              specs: Specs.max,
              onTap: () {
                logic.checkPermission();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBookCover() {
    return DecoratedBox(
      decoration: DecorationStyle.bookDecoration(),
      child: netImageCached(
        state.book.bookCovers![0].toString(),
        radius: Dimens.bookCoverRadius,
        width: Dimens.bookWidthMAX,
        height: Dimens.bookHeightMAX,
      ),
    );
  }

  Widget _buildBookName() {
    return Text(
      '${state.book.bookName}',
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyleUnit.bookNameStyle2(),
    );
  }

  Widget _buildBookAuthor() {
    return Text(
      '${state.book.bookAuthor}',
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyleUnit.bookAuthorStyle(),
    );
  }
}
