import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tin_flutter_book/common/style/style.dart';

import '../values/values.dart';

/// 通用 AppBar
AppBar commonAppBar({
  String titleStr="",
  Widget? titleWidget,
  Widget? leading,
  List<Widget>? actions,
}) {
  return AppBar(
    backgroundColor: AppColors.appBg,
    title: titleStr.isNotEmpty
        ? Text(
            titleStr,
            style: TextStyleUnit.appbar,
          )
        : titleWidget,
    leading: leading,
    actions: actions,
  );
}

/// 10像素 Divider
Widget dividerLine({
  Color bgColor = AppColors.divider,
  double heightSize = 1,
}) {
  return Container(
    height: heightSize.h,
    decoration: BoxDecoration(
      color: bgColor,
    ),
  );
}
