import 'package:flutter_screenutil/flutter_screenutil.dart';

class Dimens {
  // 设计稿中设备的屏幕尺寸
  static const double width = 375.0;
  static const double height = 812.0;

  static const double titleSize = 54.0;

  static const double menuHeight = 56.0;

  static const double menuTextSize = 10.0;
  static const double menuImgSize = 20.0;

  static const double menuBigSize = 144.0;
  // static const double elevation = 1.0;

  static  double margin = 17.0.w;

  static  double space = 5.0.w;
  static  double btnRadius = 5.w;
//  图书封面圆角
  static  double bookCoverRadius = 3.r;
  static  double btnHeight = 44.h;

  static  double bookWidth = 83.w;
  static  double bookHeight = 116.h;

  static  double bookWidthMAX = 108.w;
  static  double bookHeightMAX = 154.h;


  static  double btnWidthMin = 48.w;
  static  double btnHeightMin = 12.h;

  static  double btnWidthNor = 72.w;
  static  double btnHeightNor = 20.h;

  static  double btnWidthMax = 343.w;
  static  double btnHeightMax = 40.h;

  static  double btnFontMin = 12.sp;
  static  double btnFontNor = 14.sp;
  static  double btnFontMax = 16.sp;

  static  double btnRadiusMin = 3.r;
  static  double btnRadiusNor = 16.r;
  static  double btnRadiusMax = 22.r;


  static double getStatusBarHeight() {
    return ScreenUtil().statusBarHeight;
  }




}
