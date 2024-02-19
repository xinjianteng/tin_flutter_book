import 'dart:convert';
import 'dart:io';

import 'package:epub_view/epub_view.dart';
import 'package:get/get.dart';
import 'package:tin_flutter_book/common/widgets/toast.dart';

import '../../common/utils/DatabaseHelper.dart';
import 'reader_state.dart';

import 'package:archive/archive.dart';
import 'package:flutter/material.dart';

class ReaderLogic extends GetxController {
  final ReaderState state = ReaderState();

  late EpubController epubController;

  @override
  void onInit() {
    super.onInit();
    epubController = EpubController(
      // Load document
      document: EpubDocument.openFile(File(state.book.localFiles)),
      // document:EpubDocument.openAsset('assets/book.epub'),
      // Set start point
      epubCfi: state.book.readProgress,
    );

    // final epubBook=EpubDocument.openFile(File(state.book.localFiles));

  }

  @override
  void onClose() {
    epubController.dispose();
    super.onClose();
  }


  updateReadProgress(){
    state.book.readProgress=epubController.generateEpubCfi()!;
    DatabaseHelper().updateReadProgressData(state.book);
  }

}


