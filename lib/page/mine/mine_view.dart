import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/style/style.dart';
import '../../common/values/values.dart';
import '../../common/widgets/widgets.dart';
import 'mine_logic.dart';

class MinePage extends StatelessWidget {

  final logic = Get.put(MineLogic());
  final state = Get.find<MineLogic>().state;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: commonAppBar(
        titleWidget: const Text(AStrings.mine),
      ),
      body: buildBody(),
    );
  }


  Widget buildBody() {
    return Container(
      margin: EdgeInsets.all(Dimens.margin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: Dimens.margin * 2),
          _buildLoginBtn(),
        ],
      ),
    );
  }



  ///登录按钮
  Widget _buildLoginBtn() {
    return TextButton(
      style: TextStyleUnit.btnStyle(),
      onPressed: logic.logout,
      child: Text(
        '退出',
        style: TextStyleUnit.btnTextStyle(),
      ),
    );
  }

}
