import 'package:epub_view/epub_view.dart';
import 'package:get/get.dart';
import 'package:tin_flutter_book/common/utils/logger_util.dart';

import '../../common/entity/entities.dart';

class ReaderState {


  DownloadBook book=DownloadBook();

  // 自定义类 - 可以是任何类
  final epubBook = Rx<EpubBook>(EpubBook());


  ReaderState() {
   book= Get.arguments;
  }
}
