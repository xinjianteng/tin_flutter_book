import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tin_flutter_book/common/routers/names.dart';
import 'package:tin_flutter_book/common/store/stores.dart';
import 'package:tin_flutter_book/common/utils/encrypt_aes_utils.dart';
import 'package:tin_flutter_book/common/utils/utils.dart';

import '../../common/api/apis.dart';
import '../../common/entity/entities.dart';
import 'sign_in_state.dart';

class SignInLogic extends GetxController {
  final SignInState state = SignInState();

  TextEditingController phoneEditer = TextEditingController();
  TextEditingController passwordEditer = TextEditingController();

  login() async {
    // bmob正常登录逻辑
    // var phone = phoneEditer.text;
    // var password = passwordEditer.text;
    // phone = "15805930942";
    // password = "123456";
    // UserLoginRequestEntity params =
    //     UserLoginRequestEntity(username: phone, password: password);
    // UserLoginResponseEntity user = await UserAPI.login(params: params);
    // UserStore.to.saveProfile(user);
    // Get.offAndToNamed(AppRoutes.INITIAL);


    UserCsgLoginRequestEntity csgParams = UserCsgLoginRequestEntity(
        username: "APP@+86 19959271454",
        password: EncryptAesUtils.encryptAES("a123456", "gbcloudgbcloudgb", "gbcloudgbcloudgb"));

    UserCsgLoginResponseEntity csgUser=await CsgAPI.login(params: csgParams);
    UserStore.to.saveProfile(csgUser);
    Get.offAndToNamed(AppRoutes.INITIAL);

  }
}
