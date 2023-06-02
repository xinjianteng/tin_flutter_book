import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/values.dart';

/// 缓存图片
Widget netImageCached(
  String url, {
  double width = 48,
  double height = 48,
  BorderRadiusGeometry? borderRadius=Borders.k0pxRadius,
  EdgeInsetsGeometry? margin,
  BoxFit fit = BoxFit.fitHeight,
}) {
  return CachedNetworkImage(
    imageUrl: url,
    imageBuilder: (context, imageProvider) => Container(
      height: height.h,
      width: width.w,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        image: DecorationImage(
          image: imageProvider,
          fit: fit,
          // colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn),
        ),
      ),
    ),
    placeholder: (context, url) {
      return Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(
          value: null,
        ),
      );
    },
    errorWidget: (context, url, error) => Icon(Icons.error),
  );
}

Widget netImageCircleCached(
  String url, {
  double radius = 50,
  EdgeInsetsGeometry? margin,
}) {
  return CachedNetworkImage(
    imageUrl: url,
    placeholder: (context, url) => CircleAvatar(
      backgroundColor: Colors.amber,
      radius: radius.r,
    ),
    imageBuilder: (context, image) => CircleAvatar(
      backgroundImage: image,
      radius: radius.r,
    ),
  );
}
