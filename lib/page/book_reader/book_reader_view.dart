import 'package:epubx/src/entities/epub_chapter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/values/values.dart';
import '../../common/widgets/widgets.dart';
import 'book_reader_logic.dart';

//本来准备自己写一个epub阅读器的。有现成的就没有写了。epubview
class BookReaderPage extends StatelessWidget {
  final logic = Get.put(BookReaderLogic());
  final state = Get
      .find<BookReaderLogic>()
      .state;

  BookReaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        titleWidget: const Text(AStrings.reader),
        leading: BackButton(
          onPressed: () {
            logic.updateReadProgress();
          },
        ),
      ),
      body: Obx(() {
        return Text(state.epubBook.value.Content.toString() );
      }),
      endDrawer: Obx(() {
        return ListView.builder(
          itemBuilder: (c, i) =>
              _buildChapterWidget(state.epubBook.value.Chapters![i]),
          itemCount: state.epubBook.value.Chapters!.length,
        );
      }),
      onEndDrawerChanged: (isOpen) {

      },
    );
  }

  Widget _buildChapterWidget(EpubChapter epubChapter) {
    return ListTile(
      title: Text(epubChapter.Title!.trim()),
      onTap: () => {},
    );
  }
}
