import 'package:dio/dio.dart';
import 'package:tin_flutter_book/common/entity/user_csg.dart';

import '../entity/entities.dart';
import '../utils/app_utils.dart';
import '../utils/encrypt_utils.dart';
import '../utils/utils.dart';
import '../values/values.dart';

/// 用户
class CsgAPI {




  /// 登录
  static Future<UserCsgLoginResponseEntity> login({
    UserCsgLoginRequestEntity? params,
  }) async {
    var timeStamp = AppUtils.getTime();
    var nonce = AppUtils.getNonce();
    Map<String, String> formData = {};
    formData["deviceId"] = "2e33f78a-e0fb-4cd2-8193-f2efb7e8b3b0";
    formData["from"] = "App";
    formData["grant_type"] = "password";
    formData["loginType"] = "1";
    formData["nonce"] = nonce;
    formData["password"] = params!.password.toString();
    formData["scope"] = "app";
    formData["timestamp"] = timeStamp.toString();
    formData["username"] = params!.username.toString();
    var signStr = "";
    for (var key in formData.keys) {
      var value = formData[key];
      signStr = "${"$signStr$key=" + value!}&";
    }
    signStr = "${signStr}secret_key=4CTZ7892m8xOba48efnN4PBgqXKEKU5J";
    formData["sign"] = EncryptUtils.encryptMd5(signStr).toUpperCase();
    var response = await HttpUtil().post(
      csgApiLogin,
      data: formData,
      baseUrl: csgHost,
    );
    return UserCsgLoginResponseEntity.fromJson(
        response as Map<String, dynamic>);
  }





  /// 登录
  static Future<UserCsgLoginResponseEntity> getBooks({
    PageListRequestEntity? params,
  }) async {
    // var timeStamp = AppUtils.getTime();
    // var nonce = AppUtils.getNonce();
    // Map<String, String> formData = {};
    // formData["current"] = 1.toString();
    // formData["size"] = 20.toString();
    // formData["from"] = "APP";
    // // formData["sort"] = 1.toString();
    // formData["groupId"] = "3501598861";
    // formData["nonce"] = nonce;
    // formData["timestamp"] = timeStamp.toString();
    // var signStr = "";
    // for (var key in formData.keys) {
    //   var value = formData[key];
    //   signStr = "${"$signStr$key=" + value!}&";
    // }
    // signStr = "${signStr}secret_key=4CTZ7892m8xOba48efnN4PBgqXKEKU5J";
    // formData["sign"] = EncryptUtils.encryptMd5(signStr).toUpperCase();


    var timeStamp = AppUtils.getTime();
    var nonce = AppUtils.getNonce();
    Map<String, String> formData = {};
    formData["groupId"] = "3501598861";
    formData["size"] = "100";

    formData["nonce"] = nonce;
    formData["timestamp"] = timeStamp.toString();
    var signStr = "";
    for (var key in formData.keys) {
      var value = formData[key];
      signStr = "${"$signStr$key=" + value!}&";
    }
    signStr = "${signStr}secret_key=4CTZ7892m8xOba48efnN4PBgqXKEKU5J";
    formData["sign"] = EncryptUtils.encryptMd5(signStr).toUpperCase();

    var response = await HttpUtil().post(
      uploadBookGroup,
      data: formData,
      baseUrl: csgHost,
    );


    return UserCsgLoginResponseEntity.fromJson(
        response as Map<String, dynamic>);




  }


}
