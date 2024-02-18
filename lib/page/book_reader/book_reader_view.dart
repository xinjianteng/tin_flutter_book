import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/values/values.dart';
import '../../common/widgets/widgets.dart';
import 'book_reader_logic.dart';

class BookReaderPage extends StatelessWidget {

  final logic = Get.put(BookReaderLogic());
  final state = Get.find<BookReaderLogic>().state;


  BookReaderPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: transparentAppBar(title: AStrings.login),

    );
  }
}
