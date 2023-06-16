import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Dimens {
  static const double width = 375.0;
  static const double height = 812.0;

  static const double titleSize = 54.0;

  static const double menuHeight = 56.0;

  static const double menuTextSize = 10.0;
  static const double menuImgSize = 20.0;

  static const double menuBigSize = 144.0;
  // static const double elevation = 1.0;

  static  double margin = 12.0.w;
  static  double space = 5.0.w;
  static const double btnRadius = 5.0;
  static const double bookCoverRadius = 5.0;
  static  double btnHeight = 45.h;

  static  double bookWidth = 125;


  static double getStatusBarHeight() {
    return ScreenUtil().statusBarHeight;
  }

  // static double getHeight(num value) {
  //   return value.h;
  // }
  //
  // static double getSHeight() {
  //   return ScreenUtil().screenHeight;
  // }
  //
  // static double getWidth(num value) {
  //   return ScreenUtil().setWidth(value);
  // }
  //
  // static double getSWidth() {
  //   return ScreenUtil().screenWidth;
  // }
  //
  // static Size getSize() {
  //   return  Size(Dimens.getSWidth(), Dimens.getSHeight());
  // }
  //
  // static double getSp(num value) {
  //   return ScreenUtil().setSp(value);
  // }




}
