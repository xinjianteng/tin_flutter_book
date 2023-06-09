import 'dart:convert';

import 'package:get/get.dart';


import '../api/apis.dart';
import '../entity/entities.dart';
import '../utils/utils.dart';
import '../values/values.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();

  // 是否登录
  final _isLogin = false.obs;

  // 令牌 token
  String token = '';

  // 用户 profile
  final _profile = UserCsgLoginResponseEntity().obs;

  bool get isLogin => _isLogin.value;

  UserCsgLoginResponseEntity get profile => _profile.value;

  bool get hasToken => token.isNotEmpty;

  @override
  void onInit() {
    super.onInit();
    token = StorageService.to.getString(STORAGE_USER_TOKEN_KEY);
    var profileOffline = StorageService.to.getString(STORAGE_USER_PROFILE_KEY);
    if (profileOffline.isNotEmpty) {
      _profile(UserCsgLoginResponseEntity.fromJson(jsonDecode(profileOffline)));
    }
  }

  /// 保存 token
  Future<void> setToken(String value) async {
    await StorageService.to.setString(STORAGE_USER_TOKEN_KEY, value);
    token = value;
  }



 /// 保存 profile
  Future<void> saveProfile(UserCsgLoginResponseEntity profile) async {
    _isLogin.value = true;
    token=profile.access_token!;
    _profile.value=profile;
    StorageService.to.setString(STORAGE_USER_PROFILE_KEY, jsonEncode(profile));
  }



}
