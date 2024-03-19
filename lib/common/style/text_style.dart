import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/values.dart';

///文本样式
class TextStyleUnit {
  /// 全局 appbar标题
  static TextStyle appbar = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18.sp,
    color: AppColors.title
  );

  /// 按钮 字体样式
  static ButtonStyle btnStyle() {
    return TextButton.styleFrom(
      backgroundColor: AppColors.btn,
      elevation: 2.h,
      shadowColor:AppColors.btn,
    );
  }

  /// 按钮 字体样式
  static TextStyle btnTextStyle() {
    return TextStyle(
      color: AppColors.white,
      fontSize: 16.sp,
    );
  }

  // 编辑框
  static TextStyle input = TextStyle(
    color: AppColors.inputText,
    fontSize: 14.sp,
  );

  // 编辑框 提示语
  static TextStyle hint = TextStyle(
    color: AppColors.hint,
    fontSize: 14.sp,
  );



  /// 常规图书列表  图书名称样式
  static TextStyle bookNameStyle() {
    return TextStyle(
      color: AppColors.bookName,
      fontSize: 14.sp,
      // fontWeight: FontWeight.bold,
    );
  }

  /// 常规图书列表  图书名称样式
  static TextStyle bookNameStyle2() {
    return TextStyle(
      color: AppColors.bookName,
      fontSize: 20.sp,
      // fontWeight: FontWeight.bold,
    );
  }


  /// 常规图书列表  图书作者样式
  static TextStyle bookAuthorStyle() {
    return TextStyle(
      color: AppColors.bookAuthor,
      fontSize: 12.sp,
    );
  }


  /// 分组列表  分组名称样式
  static TextStyle groupNameStyle() {
    return TextStyle(
      color: AppColors.groupName,
      fontSize: 18.sp,
    );
  }


  ///——————————————————————————————————————————————///

  // 标题加黑
  TextStyle navSelect = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 34.sp,
  );

  // 标题加黑
  static TextStyle appBar = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 22.sp,
    color: AppColors.primaryText,
  );

//  组件列表标题
  static widgetItemTitle(bool deprecated) => TextStyle(
        fontSize: 17.sp,
        fontWeight: FontWeight.bold,
        decoration:
            deprecated ? TextDecoration.lineThrough : TextDecoration.none,
        decorationThickness: 2,
        color: AppColors.red,
      );

  //  组件列表简介
  static widgetItemInfo(bool deprecated) => TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.normal,
        decoration:
            deprecated ? TextDecoration.lineThrough : TextDecoration.none,
        decorationThickness: 2,
      );

  //  组件详情标题简介
  static widgetDetailTitle(bool deprecated) => TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        decoration:
            deprecated ? TextDecoration.lineThrough : TextDecoration.none,
        decorationThickness: 2,
        color: AppColors.red,
      );

  //  组件详情标题简介
  static TextStyle secondTitle = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryText,
  );

  //  分类标题
  static TextStyle categoryTitle = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryText,
  );

  //  分类简介
  static TextStyle categoryInfo = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryText,
  );

  //  分类简介
  static TextStyle emptyTip = TextStyle(
    fontSize: 22.sp,
    color: AppColors.blue,
  );

  static TextStyle commonChip = TextStyle(
    fontSize: 12.sp,
    color: Colors.white,
  );

  static TextStyle splashShadows = TextStyle(
    color: AppColors.secondaryText,
    shadows: [
      Shadow(
        color: Colors.black,
        blurRadius: 1,
        offset: Offset(0.1, 0.1),
      )
    ],
    fontSize: 12.sp,
  );

  static TextStyle deprecatedChip = TextStyle(
    fontSize: 12.sp,
    color: Colors.white,
    decoration: TextDecoration.lineThrough,
    decorationThickness: 2,
  );
}
