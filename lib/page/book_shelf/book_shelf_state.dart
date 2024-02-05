import 'package:get/get.dart';
import 'package:tin_flutter_book/common/entity/books.dart';

class BookShelfState {

  // 组件列表
  RxList<DownloadBook> books = <DownloadBook>[].obs;


  BookShelfState() {
    ///Initialize variables
  }
}
