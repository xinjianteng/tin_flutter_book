import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common/entity/books.dart';
import '../../common/values/values.dart';

class MainState {
  MainState() {
    ///Initialize variables
  }


  // 组件列表
  RxList<UploadBook> newsList = <UploadBook>[].obs;


  //列表显示样式，1=listview  2：Gridview
  RxInt viewStyle=1.obs;

  var crossAxisCount = ScreenUtil().screenWidth ~/ Dimens.bookWidth;


}
