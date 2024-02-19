import 'package:epub_view/epub_view.dart';
import 'package:get/get.dart';
import 'package:tin_flutter_book/common/utils/logger_util.dart';

import '../../common/entity/entities.dart';

class ReaderState {


  DownloadBook book=DownloadBook();

  ReaderState() {
   book= Get.arguments;
   logPrint(book);

  }
}
