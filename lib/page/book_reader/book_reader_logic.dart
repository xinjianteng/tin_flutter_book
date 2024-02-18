import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:get/get.dart';
import 'package:tin_flutter_book/common/utils/logger_util.dart';

import 'book_reader_state.dart';

class BookReaderLogic extends GetxController {
  final BookReaderState state = BookReaderState();


  @override
  void onInit() {
    super.onInit();
    extractHtmlFromEpub(state.book.localFiles);
  }



// 解析EPUB文件中的HTML内容
  Future<String> extractHtmlFromEpub(String epubFilePath) async {

//  首先，你需要将 EPUB 文件解压并读取其中的内容。
    final bytes = File(epubFilePath).readAsBytesSync();

//  使用 archive 或 zip 等库来处理 ZIP 压缩包。
    final archive = ZipDecoder().decodeBytes(bytes);

//  解析 OPF（Open Packaging Format）文件以获取书籍结构和元数据信息。
    final opfFile = archive.findFile('OEBPS/content.opf');


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

    // 这里仅作示意，实际应根据OPF文件解析出HTML文件路径
    final htmlFile = archive.findFile('OEBPS/chapter1.html');

    final Uri _url = Uri.parse('https://flutter.cn');
    return utf8.decode(htmlFile!.content as List<int>);
  }

}



