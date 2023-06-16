import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tin_flutter_book/common/routers/names.dart';
import 'package:tin_flutter_book/common/style/decoration_style.dart';

import '../../common/style/style.dart';
import '../../common/values/values.dart';
import '../../common/widgets/widgets.dart';
import 'sign_in_logic.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(SignInLogic());
    final state = Get.find<SignInLogic>().state;

    return Scaffold(
      appBar: transparentAppBar(title: AStrings.login),
      body: buildBody(logic),
    );
  }

  Widget buildBody(SignInLogic logic) {
    return Container(
      margin:  EdgeInsets.all(Dimens.margin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildPhone(logic),
          SizedBox(height: Dimens.margin),
          _buildPassword(logic),
          SizedBox(height: Dimens.margin * 2),
          _buildLoginBtn(logic),
          SizedBox(height: Dimens.margin),
          _buildRegisterBtn(logic),
        ],
      ),
    );
  }


  ///输入框——手机号
  Widget _buildPhone(SignInLogic logic) {
    return Container(
      width: ScreenUtil().screenWidth*0.7,
      padding:  EdgeInsets.symmetric(horizontal: 8.w),
      decoration: DecorationStyle.input,
      child: TextField(
        controller: logic.phoneEditer,
        keyboardType: TextInputType.phone,
        style: TextStyleUnit.input,
        decoration: DecorationStyle.inputDecoration(hintStr: '请输入手机号'),
      ),
    );
  }

  ///输入框——密码
  Widget _buildPassword(SignInLogic logic) {
    return Container(
      width: ScreenUtil().screenWidth*0.7,
      padding:  EdgeInsets.symmetric(horizontal: 8.w),
      decoration: DecorationStyle.input,
      child: TextField(
        controller: logic.passwordEditer,
        keyboardType: TextInputType.visiblePassword,
        style: TextStyleUnit.input,
        decoration: DecorationStyle.inputDecoration(hintStr: '请输入密码，默认密码123456'),
      ),
    );
  }

  ///登录按钮
  Widget _buildLoginBtn(SignInLogic logic) {
    return Container(
      decoration: DecorationStyle.btn,
      height: Dimens.btnHeight,
      child: TextButton(
        onPressed: logic.login,
        child:  Text(
          '登录',
          style: TextStyleUnit.btnTextStyle(),
        ),
      ),
    );
  }

  ///注册按钮
  Widget _buildRegisterBtn(SignInLogic logic) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.primaryButton,
      ),
      height: 40,
      child: TextButton(
        onPressed: () {
          Get.toNamed(AppRoutes.REGISTER);
        },
        child:  Text(
          '注册',
          style: TextStyleUnit.btnTextStyle(),
        ),
      ),
    );
  }
}
