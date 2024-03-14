import 'package:get/get.dart';
import 'package:tin_flutter_book/common/widgets/widgets.dart';

import '../../common/store/stores.dart';
import 'mine_state.dart';

class MineLogic extends GetxController {
  final MineState state = MineState();




  logout() async {
    // bmob正常登录逻辑

    // UserLoginRequestEntity params =
    //     UserLoginRequestEntity(username: state.mobileStr.value, password: state.mobileStr.value);
    // UserLoginResponseEntity user = await BmobAPI.login(params: params);
    // // UserStore.to.saveProfile(user.);
    // Get.offAndToNamed(AppRoutes.INITIAL);

    UserStore.to.cleanProfile();
    toastInfo(msg: '退出成功');

  }


}
