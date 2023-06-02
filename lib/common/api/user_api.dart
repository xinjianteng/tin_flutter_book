
import 'package:dio/dio.dart';

import '../entity/entities.dart';
import '../utils/dio_util.dart';
import '../utils/utils.dart';
import '../values/values.dart';

/// 用户
class UserAPI {

  /// 登录
  static Future<UserLoginResponseEntity> login({
    UserLoginRequestEntity? params,
  }) async {
    // var response = await HttpUtil().get(
    //   '/1/login',
    //   queryParameters: params?.toJson(),
    //   baseUrl: BMOB_API_HOST,
    // );


    var response =DioUtil().request( '/1/login',method: DioMethod.get,params: params!.toJson());

    return UserLoginResponseEntity.fromJson(response as Map<String, dynamic>);
  }


  /// 注册
  static Future<UserRegisterRequestEntity> register({
    UserRegisterRequestEntity? params,
  }) async {
    var response = await HttpUtil().post(
      '/1/users',
      queryParameters: params!.toJson(),
      baseUrl: BMOB_API_HOST,
    );

    // var response =DioUtil().request( '/1/users',method: DioMethod.post,params: params!.toJson());

    return UserRegisterRequestEntity.fromJson(response as Map<String, dynamic>);
  }

  /// Profile
  static Future<UserLoginResponseEntity> profile() async {
    var response = await HttpUtil().post(
      '/user/profile',
    );
    return UserLoginResponseEntity.fromJson(response);
  }

  /// Logout
  static Future logout() async {
    return await HttpUtil().post(
      '/user/logout',
    );
  }
}
