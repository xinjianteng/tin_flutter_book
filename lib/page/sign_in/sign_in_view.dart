import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tin_flutter_book/common/routers/names.dart';

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
      appBar: transparentAppBar(title:const Text("登录")),
      backgroundColor: Colors.white,
      body: buildBody(logic),
    );
  }


  Widget buildBody(SignInLogic logic) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 20),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildPhone(logic),
              const SizedBox(height: 10),
              buildPassword(logic),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.primary,
                ),
                height: 40,
                child: TextButton(
                  onPressed: logic.login,
                  child: const Text(
                    '登录',
                    style: TextStyle(fontSize: 16, color: Color(0xffffffff)),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.primary,
                ),
                height: 40,
                child: TextButton(
                  onPressed: (){
                    Get.toNamed(AppRoutes.REGISTER);
                  },
                  child: const Text(
                    '注册',
                    style: TextStyle(fontSize: 16, color: Color(0xffffffff)),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }


  Widget buildPhone(SignInLogic logic) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.borderColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        controller: logic.phoneEditer,
        keyboardType: TextInputType.phone,
        style: const TextStyle(fontSize: 14, color: AppColors.primaryText),
        decoration: const InputDecoration(
          hintText: '请输入手机号',
          hintStyle: TextStyle(color: AppColors.secondaryText),
          border: InputBorder.none,
        ),
      ),
    );
  }



  Widget buildPassword(SignInLogic logic) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.borderColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        controller: logic.passwordEditer,
        keyboardType: TextInputType.visiblePassword,
        style: const TextStyle(fontSize: 14, color: AppColors.primaryText),
        decoration: const InputDecoration(
          hintText: '请输入密码，默认密码123456',
          hintStyle: TextStyle(color: AppColors.secondaryText),
          border: InputBorder.none,
        ),
      ),
    );
  }


}
