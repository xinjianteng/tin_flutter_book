import 'package:get/get.dart';
import 'package:tin_flutter_book/common/store/stores.dart';

import '../../common/entity/entities.dart';
import '../../common/utils/utils.dart';

class BookDetailState {
  final bookId = "".obs;
  final bookName = "".obs;
  final bookAuthor = "".obs;
  final bookCover = "".obs;

  Rx<UploadBook> book = UploadBook().obs;

  BookDetailState() {
    bookId.value = Get.parameters['bookId']!;
    bookName.value = Get.parameters['bookName']!;
    // bookAuthor.value=Get.parameters['bookAuthor']!;
    bookCover.value = Get.parameters['bookCover']!;
    UserStore.to.getBook(bookId.value).then((value) => book.value = value);
  }
}
