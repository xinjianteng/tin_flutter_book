import 'package:flutter/cupertino.dart';

/// 组件分页 request
///
class PageListRequestEntity {
  String? limit;
  String? skip;
  String? count;
  String? where;
  String? order;

  PageListRequestEntity({
    Key? key,
    this.limit,
    this.skip,
    this.count,
    this.where,
    this.order,
  });

  Map<String, dynamic> toJson() => {
    "limit": limit,
    "skip": skip,
    "count": count,
    "where": where,
    "order": order,
  };
}
