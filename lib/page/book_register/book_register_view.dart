import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'book_register_logic.dart';

class BookRegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.put(BookRegisterLogic());
    final state = Get.find<BookRegisterLogic>().state;

    return Container();
  }
}
