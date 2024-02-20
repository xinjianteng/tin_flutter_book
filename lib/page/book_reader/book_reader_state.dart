import 'package:epub_view/epub_view.dart';
import 'package:get/get.dart';

import '../../common/entity/entities.dart';

class BookReaderState {

  DownloadBook book=DownloadBook();



  // 自定义类 - 可以是任何类
  final epubBook = Rx<EpubBook>(EpubBook());


  BookReaderState() {
    ///Initialize variables
    book= Get.arguments;
  }
}
