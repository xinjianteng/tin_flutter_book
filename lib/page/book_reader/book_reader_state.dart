import 'package:get/get.dart';

import '../../common/entity/entities.dart';

class BookReaderState {

  DownloadBook book=DownloadBook();



  BookReaderState() {
    ///Initialize variables
    book= Get.arguments;
  }
}
