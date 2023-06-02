import 'package:flutter/cupertino.dart';

/// 组件分页 response
class BookPageListResponseEntity {
  int count;
  List<BooksVo>? results;

  BookPageListResponseEntity({
    required this.results,
    required this.count,
  });

  factory BookPageListResponseEntity.fromJson(Map<String, dynamic> json) =>
      BookPageListResponseEntity(
        count: json["count"],
        results: json["results"] == null
            ? []
            : List<BooksVo>.from(
                json["results"].map((x) => BooksVo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class BooksVo {
  String? objectId;

  String? fileName;
  String? cover;
  String? name;

  String? updatedAt;

  BooksVo({
    Key? key,
    this.objectId,
    this.fileName,
    this.cover,
    this.name,
    this.updatedAt,
  });

  Map<String, dynamic> toJson() => {
        "objectId": objectId,
        "fileName": fileName,
        "name": name,
        "cover": cover,
        "updatedAt": updatedAt,
      };

  factory BooksVo.fromJson(Map<String, dynamic> json) => BooksVo(
        objectId: json["objectId"],
        fileName: json["fileName"],
        name: json["name"],
        cover: json["cover"],
        updatedAt: json["updatedAt"],
      );

  static convertImage(String name) {
    return name.isEmpty ? null : AssetImage(name);
  }

  static List<int> formatLinkTo(String links) {
    if (links.isEmpty) {
      return [];
    }
    if (!links.contains(',')) {
      return [int.parse(links)];
    }
    return links.split(',').map<int>((e) => int.parse(e)).toList();
  }
}
