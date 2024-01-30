import 'package:flutter/cupertino.dart';

/// 组件分页 response
class BookPageListResponseEntity {
  int count;
  List<UploadBook>? results;

  BookPageListResponseEntity({
    required this.results,
    required this.count,
  });

  factory BookPageListResponseEntity.fromJson(Map<String, dynamic> json) =>
      BookPageListResponseEntity(
        count: json["count"],
        results: json["results"] == null
            ? []
            : List<UploadBook>.from(
                json["results"].map((x) => UploadBook.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class UploadBook {
  String? bookId;
  String? bookName;
  String? bookAuthor;
  List? bookCovers;

  UploadBook({
    Key? key,
    this.bookId,
    this.bookName,
    this.bookAuthor,
    this.bookCovers,
  });

  Map<String, dynamic> toJson() => {
        "bookId": bookId,
        "bookName": bookName,
        "bookAuthor": bookAuthor,
        "cover": bookCovers,
      };

  factory UploadBook.fromJson(Map<String, dynamic> json) => UploadBook(
        bookId: json["bookId"],
        bookName: json["bookName"],
        bookAuthor: json["bookAuthor"],
        bookCovers: json["bookCovers"],
      );
}

class DownloadBookResponseEntity<T> {
  String? msg;
  int? code;
  String? sign;
  String? nonce;
  DownloadBook data;

  DownloadBookResponseEntity({
    this.msg,
    this.code,
    this.sign,
    this.nonce,
    required this.data,
  });

  factory DownloadBookResponseEntity.fromJson(Map<String, dynamic> json) =>
      DownloadBookResponseEntity(
        msg: json["msg"],
        code: json["code"],
        sign: json["sign"],
        nonce: json["nonce"],
        data: DownloadBook.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "code": code,
        "sign": sign,
        "nonce": nonce,
        "data": data,
      };
}

class DownloadBook {
  String? bookId;
  String? bookName;
  String? bookCover;
  String? encryptFilePath;
  String? filePath;
  String? downloadUrl;
  String? rawDownloadUrl;
  int? isUpload;
  String? bookAuthor;
  int? fileFormat;

  DownloadBook(
      {Key? key,
      this.bookId,
      this.bookName,
      this.bookCover,
      this.encryptFilePath,
      this.filePath,
      this.downloadUrl,
      this.rawDownloadUrl,
      this.isUpload,
      this.bookAuthor,
      this.fileFormat});

  Map<String, dynamic> toJson() => {
        "bookId": bookId,
        "bookName": bookName,
        "bookCover": bookCover,
        "encryptFilePath": encryptFilePath,
        "filePath": filePath,
        "downloadUrl": downloadUrl,
        "rawDownloadUrl": rawDownloadUrl,
        "isUpload": isUpload,
        "bookAuthor": bookAuthor,
        "fileFormat": fileFormat,
      };

  factory DownloadBook.fromJson(Map<String, dynamic> json) => DownloadBook(
        bookId: json["bookId"],
        bookName: json["bookName"],
        bookCover: json["bookCover"],
        encryptFilePath: json["encryptFilePath"],
        filePath: json["filePath"],
        downloadUrl: json["downloadUrl"],
        rawDownloadUrl: json["rawDownloadUrl"],
        isUpload: json["isUpload"],
        bookAuthor: json["bookAuthor"],
        fileFormat: json["fileFormat"],
      );
}
