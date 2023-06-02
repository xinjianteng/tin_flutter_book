import 'package:get/get.dart';

class ApplicationState {


  // 当前 tab 页码
  final _page = 0.obs;
  set page(value) => _page.value = value;
  get page => _page.value;


  // tab 页标题
  late final List<String> tabTitles;


  ApplicationState() {
    ///Initialize variables
    ///
    // 准备一些静态数据
    tabTitles = ['Welcome', 'Cagegory', 'Bookmarks', 'Account'];
  }



}
