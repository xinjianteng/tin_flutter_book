

import 'dart:ffi';

import 'package:flutter/material.dart';

import 'entities.dart';

class Group{
  int isGroup=1;
  String? bookId;
  String? bookName;

  List<UploadBook> bookList=[];


  // isGroup: 1, bookName: 热门动漫小说, bookId: 3501896864

  Group({
    Key? key,
    required this.isGroup,
    this.bookId,
    this.bookName,
  });

  Map<String, dynamic> toJson() => {
    "isGroup": isGroup,
    "bookId": bookId,
    "bookName": bookName,
  };

  factory Group.fromJson(Map<String, dynamic> json) => Group(
    isGroup: json["isGroup"],
    bookId: json["bookId"],
    bookName: json["bookName"],
  );
}