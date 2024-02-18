import 'package:get/get.dart';
import 'package:tin_flutter_book/common/store/stores.dart';

import '../../common/entity/entities.dart';

class BookDetailState {


  UploadBook book = UploadBook();

  BookDetailState() {
    book= Get.arguments;
  }
}
