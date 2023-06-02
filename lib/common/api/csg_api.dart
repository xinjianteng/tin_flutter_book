import 'package:dio/dio.dart';
import 'package:tin_flutter_book/common/entity/user_csg.dart';
import 'package:tin_flutter_book/common/utils/dio_util.dart';

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
    // formData["password"] = params!.password.toString();
    // formData["username"] = params!.username.toString();
    // formData["loginType"] = "1";
    // formData["grant_type"] = "password";
    // formData["scope"] = "app";
    // formData["from"] = "App";
    // formData["deviceId"] = "2e33f78a-e0fb-4cd2-8193-f2efb7e8b3b0";
    formData["timestamp"] = timeStamp.toString();
    formData["nonce"] = nonce;

    var signStr = "";
    for (var key in formData.keys) {
      var value = formData[key];
      signStr = "${"$signStr$key=" + value!}&";
    }
    signStr = "${signStr}secret_key=7piVmZCu3aMoGBWMkeGUQtGGPRW0x32q";

    formData["sign"] = EncryptUtils.encryptMd5(signStr);

    //
    // FormData formData2 = FormData.fromMap({
    //   "password": params?.password,
    //   "username": params?.username,
    //   "loginType": "1",
    //   "grant_type": "password",
    //   "scope": "app",
    //   "from": "App",
    //   "deviceId": "2e33f78a-e0fb-4cd2-8193-f2efb7e8b3b0",
    //   "nonce":nonce,
    //   "timestamp":timeStamp.toString(),
    // });

    // var response = await HttpUtil().post(
    //   '/basis/appPopup/listClient',
    //   // '/basis/version/updateInfo',
    //   data: formData,
    //   baseUrl: CSG_API_HOST,
    //   // queryParameters: formData,
    // );

    var response = DioUtil().request(
      '/basis/version/updateInfo',
      method: DioMethod.post,
      params: formData,
    );

    return UserCsgLoginResponseEntity.fromJson(
        response as Map<String, dynamic>);
  }
}
