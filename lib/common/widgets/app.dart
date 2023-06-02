import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/values.dart';



/// 透明背景 AppBar
AppBar transparentAppBar({
  Widget? title,
  Widget? leading,
  List<Widget>? actions,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: title != null
        ? Center(
      child: title,
    )
        : null,
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
