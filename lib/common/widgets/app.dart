import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tin_flutter_book/common/style/style.dart';

import '../values/values.dart';

/// 通用 AppBar
AppBar transparentAppBar({
  String? title,
  Widget? leading,
  List<Widget>? actions,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    title: Text(
      title!,
      style: TextStyleUnit.appbar,
    ),
    leading: leading,
    actions: actions,
  );
}


/// 10像素 Divider
Widget dividerLine({
  Color bgColor = AppColors.divider,
  double heightSize = 2,
}) {
  return Container(
    height: heightSize.w,
    decoration: BoxDecoration(
      color: bgColor,
    ),
  );
}
