import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'book_main_logic.dart';


class BookMainPage extends StatelessWidget {
  final logic = Get.put(BookMainLogic());
  final state = Get.find<BookMainLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
