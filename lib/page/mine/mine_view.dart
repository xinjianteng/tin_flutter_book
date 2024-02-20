import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'mine_logic.dart';

class MinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.put(MineLogic());
    final state = Get.find<MineLogic>().state;

    return Container();
  }
}
