

import '../entity/books.dart';
import '../entity/page.dart';
import '../utils/http.dart';
import '../utils/utils.dart';
import '../values/constant.dart';

/// 组件
class BooksAPI {
  /// 翻页
  /// refresh 是否刷新
  static Future<BookPageListResponseEntity> bookPageList({
    PageListRequestEntity? params,
    bool refresh = false,
    bool cacheDisk = false,
  }) async {
    var response = await HttpUtil().get(
      '/1/classes/book',
      queryParameters: params?.toJson(),
      refresh: refresh,
      cacheDisk: cacheDisk,
      cacheKey: BOOK_HTTP_RECOMMEND_CACHE_KEY,
    );
    return BookPageListResponseEntity.fromJson(response);
  }




}
