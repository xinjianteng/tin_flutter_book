import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ApplicationState {


  // 当前 tab 页码
  final _page = 1.obs;
  set page(value) => _page.value = value;
  get page => _page.value;


  // tab 页标题
  late final List<String> tabTitles;


  List<Image> tabImages = [
    Image.asset('assets/tab_desk_nor.png'),
    Image.asset('assets/tab_home_nor.png'),
    Image.asset('assets/tab_profile_nor.png'),
  ];
  List<Image> tabSelectedImages = [
    Image.asset('assets/tab_desk_sel.png'),
    Image.asset('assets/tab_home_sel.png'),
    Image.asset('assets/tab_profile_sel.png'),
  ];



  ApplicationState() {
    ///Initialize variables
    ///
    // 准备一些静态数据
    tabTitles = ['Welcome', 'Cagegory', 'Bookmarks', 'Account'];
  }



}
