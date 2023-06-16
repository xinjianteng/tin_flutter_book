import 'package:flutter/cupertino.dart';

import 'entities.dart';

/// 组件分页 request
///
class PageListRequestEntity {
  String? size;
  String? current;

  PageListRequestEntity({
    Key? key,
    this.size,
    this.current,
  });

  Map<String, dynamic> toJson() => {
        "size": size,
        "current": current,
      };
}

class PageListResponseEntity<T> {
  String? msg;
  int? code;
  String? sign;
  String? nonce;
  Datas? data;

  PageListResponseEntity({
    this.msg,
    this.code,
    this.sign,
    this.nonce,
    this.data,
  });

  factory PageListResponseEntity.fromJson(Map<String, dynamic> json) =>
      PageListResponseEntity(
        msg: json["msg"],
        code: json["code"],
        sign: json["sign"],
        nonce: json["nonce"],
        data: Datas.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "code": code,
        "sign": sign,
        "nonce": nonce,
        "data": data,
      };
}

class Datas {
  int total = 0;
  int current = 0;
  int pages = 0;
  int size = 0;
  List<UploadBook> records = [];

  Datas({
    required this.total,
    required this.current,
    required this.pages,
    required this.size,
    required this.records,
  });

  factory Datas.fromJson(Map<String, dynamic> json) => Datas(
        total: json["total"],
        current: json["current"],
        pages: json["pages"],
        size: json["size"],
        records: json["records"] == null
            ? []
            : List<UploadBook>.from(
                json["records"].map((x) => UploadBook.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "current": current,
        "pages": pages,
        "size": size,
        "records": records == null
            ? []
            : List<dynamic>.from(records!.map((x) => x.toJson())),
      };
}
