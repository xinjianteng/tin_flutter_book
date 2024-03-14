import 'dart:convert';
import 'dart:io' as io;

import 'package:archive/archive.dart';
import 'package:epub_view/epub_view.dart';
import 'package:get/get.dart';
import 'package:tin_flutter_book/common/utils/logger_util.dart';
import 'package:tin_flutter_book/common/widgets/toast.dart';

import '../../common/utils/DatabaseHelper.dart';
import 'book_reader_state.dart';

class BookReaderLogic extends GetxController {
  final BookReaderState state = BookReaderState();

  late EpubController epubController;

  @override
  void onInit() {
    super.onInit();
    extractBookAttributeFromEpub(state.book.localFiles);
  }

  updateReadProgress() {
    state.book.readProgress = epubController.generateEpubCfi()!;
    DatabaseHelper().updateBookReadProgressData(state.book).then(
      (int insertedId) {
        // 成功处理代码
        Get.back();
      },
    ).catchError((Object error) {
      // 错误处理代码
      toastInfo(msg: "进度保存异常,请反馈给开发者");
      logPrint('An error occurred while reading the file: $error');
    });
  }

  extractBookAttributeFromEpub(String epubFilePath) async {
    EpubDocument.openFile(io.File(state.book.localFiles)).then(
      (EpubBook epubBook) {
        state.epubBook.value = epubBook;
        update();
        logPrint(epubBook);
      },
      onError: (Object error) {
        logPrint(error.toString());
      },
    );
  }

// 解析EPUB文件中的HTML内容
//  参考epub文章：https://www.jianshu.com/p/23f027ef32f6?utm_campaign=maleskine
  Future<String> extractHtmlFromEpub(String epubFilePath) async {
//  首先，你需要将 EPUB 文件解压并读取其中的内容。
    final bytes = io.File(epubFilePath).readAsBytesSync();

//  使用 archive 或 zip 等库来处理 ZIP 压缩包。
    final archive = ZipDecoder().decodeBytes(bytes);

    // META-INF用于存放容器信息，该目录包含一个文件，即container.xml。
    // （container.xml的主要功能用于告诉阅读器，电子书的根文件（rootfile）的路径和打开放式，一般来讲，
    // 该container.xml文件也不需要作任何修改，除非你改变了根文件的路径和文件名称）。
    final containerFile = archive.findFile('META-INF/container.xml');
    final containerFileContent =
        utf8.decode(containerFile!.content as List<int>);

    // final document=DocumentFragment.html(containerFile!.comment);
    // final content =ZipDecoder().decodeBytes(containerFile!.content);

//  解析 OPF（Open Packaging Format）文件以获取书籍结构和元数据信息。
    final opfFile = archive.findFile('OEBPS/content.opf');

    // 这里仅作示意，实际应根据OPF文件解析出HTML文件路径
    final htmlFile = archive.findFile('OEBPS/Text/Section0001_0001.xhtml');
    final result = utf8.decode(htmlFile!.content as List<int>);
    logPrint(result);
    return result;

    //  解析各个 HTML 内容文件和 CSS 样式表。
//
//  显示内容：
//  使用 flutter_html 或者自定义 WebView 组件来渲染 HTML 内容。
//  将解析到的 CSS 应用到对应的 HTML 文档中。
//  实现页面翻页功能，包括前后章节跳转和内部链接跳转。
//
//  导航与书签：
//  创建书籍目录界面，并根据 TOC（Table of Contents）文件构建可点击的目录项。
//  实现书签功能，允许用户在特定位置添加书签。
//
//  定制阅读体验：
//  提供字体大小、主题颜色等设置选项。
//  支持夜间模式或自定义背景色。
//  实现文本重排版功能，确保内容适应不同屏幕尺寸和方向。
//  以下是一个简化的示例，展示如何使用 archive 和 flutter_html 库开始解析 EPUB 文件：
  }
}
