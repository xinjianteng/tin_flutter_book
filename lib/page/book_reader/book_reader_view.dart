import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/values/values.dart';
import '../../common/widgets/widgets.dart';
import 'book_reader_logic.dart';

//本来准备自己写一个epub阅读器的。有现成的就没有写了。epubview
class BookReaderPage extends StatelessWidget {

  final logic = Get.put(BookReaderLogic());
  final state = Get.find<BookReaderLogic>().state;


  BookReaderPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: commonAppBar(titleStr: AStrings.login),

    );
  }
}
