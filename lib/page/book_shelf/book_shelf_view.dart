import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tin_flutter_book/common/widgets/app.dart';

import 'book_shelf_logic.dart';

class BookShelfPage extends StatelessWidget {
  final logic = Get.put(BookShelfLogic());
  final state = Get.find<BookShelfLogic>().state;

   BookShelfPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: transparentAppBar(title: '书架'),

    );
  }
}
