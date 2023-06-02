import 'dart:math';

class AppUtils {
  /// 获取时间戳
  /// 不传值 代表获取当前时间戳
  static int getTime([DateTime? time]) {
    return DateTime.now().millisecondsSinceEpoch;
  }


  //print(now);//打印当前时间 2020-12-29 06:21:34.729165
  //print(now.millisecondsSinceEpoch);//时间戳  1609222955510
  //print(DateTime.fromMicrosecondsSinceEpoch(1608623002151));//时间戳转换成时间 1970-01-19 14:50:23.002151
  //print(formatDate(DateTime(2020, 12, 29), [yyyy, '年', mm, '月', dd]));//打印时间 格式


  static const String NONCE_SET =
      "0123456789abcdefghijklmnoprrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";

  static String getNonce() {
    var length = NONCE_SET.length;
    var str = "";
    for (var i = 0; i < 16; i++) {
      str = str + NONCE_SET[Random().nextInt(length)];
    }
    return str;
  }





}
