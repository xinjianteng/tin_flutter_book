import 'package:get/get.dart';

import '../../common/entity/entities.dart';

class BookDetailState {


  UploadBook book = UploadBook();

  BookDetailState() {
    book= Get.arguments;
  }
}
