import 'package:flutter/cupertino.dart';

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


class PageListResponseEntity{
  String? msg;
  String? code;
  String? sign;
  String? nonce;

  PageListResponseEntity({
    this.msg,
    this.code,
    this.sign,
    this.nonce,
  });


  factory PageListResponseEntity.fromJson(Map<String, dynamic> json) =>
      PageListResponseEntity(
        msg: json["msg"],
        code: json["code"],
        sign: json["sign"],
        nonce: json["nonce"],
      );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "code": code,
    "sign": sign,
    "nonce": nonce,
  };

}