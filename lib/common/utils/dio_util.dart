import 'package:dio/dio.dart';

import '../values/values.dart';

/// 请求方法
enum DioMethod {
  get,
  post,
  put,
  delete,
  patch,
  head,
}

class DioUtil {
  /// 单例模式
  static DioUtil? _instance;

  factory DioUtil() => _instance ?? DioUtil._internal();

  static DioUtil? get instance => _instance ?? DioUtil._internal();

  /// Dio实例
  static Dio _dio = Dio();


  /// 初始化
  DioUtil._internal() {
    // 初始化基本选项
    BaseOptions options = BaseOptions(
      // baseUrl: BMOB_API_HOST,
      baseUrl: CSG_API_HOST,
      contentType: Headers.formUrlEncodedContentType,
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 3),
      headers: {
        'deviceId':'2e33f78a-e0fb-4cd2-8193-f2efb7e8b3b0',
        'appVersion':'514337',
        'appVersionNo':'8.5.0',
        'deviceModel':'2107119DC',
        'deviceFactory':'Xiaomi',
        'osType':'1',
        'osVersion':'33',
        'netType':'6',
      }
    );

    _instance = this;
    // 初始化dio
    _dio = Dio(options);
    // 添加拦截器
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: _onRequest,
      onResponse: _onResponse,
      onError: _onError,
    ));
  }

  /// 请求拦截器
  void _onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // 对非open的接口的请求参数全部增加userId
    // if (!options.path.contains("open")) {
    //   options.queryParameters["userId"] = "xxx";
    // }
    // // 头部添加token
    // options.headers["Authorization"] = "Basic cGM6cGM=";
    options.headers.addAll(getOtherHeader());

    // options.headers['X-Bmob-Application-Id'] = BMOB_APPID;
    // options.headers['X-Bmob-REST-API-Key'] = BMOB_APIKEY;

    // options.headers['X-Bmob-Application-Id'] = BMOB_APPID;
    // options.headers['X-Bmob-REST-API-Key'] = BMOB_APIKEY;

    // 更多业务需求
    handler.next(options);
    // super.onRequest(options, handler);
  }



  /// 读取本地其他配置
  Map<String, dynamic> getOtherHeader() {
    var headers = <String, dynamic>{};
    headers['deviceId'] = '2e33f78a-e0fb-4cd2-8193-f2efb7e8b3b0';
    headers['appVersion'] = '514337';
    headers['appVersionNo'] = '8.5.0';
    headers['deviceModel'] = '2107119DC';
    headers['deviceFactory'] = 'Xiaomi';
    headers['osType'] = '1';
    headers['osVersion'] = '33';
    headers['netType'] = '6';
    return headers;
  }

  /// 相应拦截器
  void _onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    // 请求成功是对数据做基本处理
    if (response.statusCode == 200) {
      // ....
    } else {
      // ....
    }
    if (response.requestOptions.baseUrl.contains("???????")) {
      // 对某些单独的url返回数据做特殊处理
    }
    handler.next(response);
  }

  /// 错误处理
  void _onError(DioError error, ErrorInterceptorHandler handler) {
    handler.next(error);
  }

  /// 请求类
  Future<T> request<T>(
    String path, {
    DioMethod method = DioMethod.get,
    Map<String, dynamic>? params,
    data,
    CancelToken? cancelToken,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    const _methodValues = {
      DioMethod.get: 'get',
      DioMethod.post: 'post',
      DioMethod.put: 'put',
      DioMethod.delete: 'delete',
      DioMethod.patch: 'patch',
      DioMethod.head: 'head'
    };
    options ??= Options(method: _methodValues[method],contentType: Headers.formUrlEncodedContentType);
    try {
      Response response;
      response = await _dio.request(path,
          data: data,
          queryParameters: params,
          cancelToken: cancelToken,
          options: options,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress);
      return response.data;
    } on DioError catch (e) {
      rethrow;
    }
  }

  /// 开启日志打印
  /// 需要打印日志的接口在接口请求前 DioUtil.instance?.openLog();
  void openLog() {
    _dio.interceptors
        .add(LogInterceptor(responseHeader: false, responseBody: true));
  }

  Future get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    var response = await _dio.get(
      path,
      queryParameters: {'id': 12, 'name': 'dio'},
    );
   return response.data;
  }




}
