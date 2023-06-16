import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


/// 缓存图片
Widget netImageCached(
  String url, {
  double width = 48,
  double height = 48,
  double radius = 0,
  EdgeInsetsGeometry? margin,
  BoxFit fit = BoxFit.fitHeight,
}) {
  return CachedNetworkImage(
    imageUrl: url,
    imageBuilder: (context, imageProvider) => Container(
      height: height,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        image: DecorationImage(
          image: imageProvider,
          fit:  BoxFit.cover,
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
