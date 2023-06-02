import 'dart:convert';

import 'package:crypto/crypto.dart';

class EncryptUtils {

  // void encryptBase64(String str) {
  //   print("Base64加密前文本：" + str);
  //   var content = utf8.encode(str);
  //   var digest = base64Encode(content);
  //   base64String = digest.toString();
  //
  //   print("Base64加密后文本：" + base64String);
  // }
  //
  // void decryptBase64() {
  //   print("Base64解密前文本：" + base64String);
  //   base64String = String.fromCharCodes(base64Decode(base64String));
  //   print("Base64解密后文本：" + base64String);
  // }


//MD5
  static String  encryptMd5(String str) {
    print("Md5加密前文本：" + str);
    //转化字符串
    final utf = utf8.encode(str);
    //加密
    final digest = md5.convert(utf);
    final encryptStr = digest.toString();
    print("Md5加密后文本：" + encryptStr);
    return encryptStr;
  }

//SHA1
  void encryptSHA1(String str) {
    print("SHA加密前文本：" + str);
    final utf = utf8.encode(str);
    final digest = sha1.convert(utf);
    final encryptStr = digest.toString();
    print("SHA加密后文本：" + encryptStr);
  }

  void encryptSHA256(String str) {
    print("SHA256加密前文本：" + str);
    final utf = utf8.encode(str);
    final digest = sha256.convert(utf);
    final encryptStr = digest.toString();
    print("SHA256加密后文本：" + encryptStr);
  }


//HMAC加密，即带有哈希的加密算法，使用键值进行加密
  void encryptHMACSHA256(String hmacKey, String hmacValue) {
    print("加密前文本：key:$hmacKey value:$hmacValue");
    var key = utf8.encode(hmacKey);
    var bytes = utf8.encode(hmacValue);
    //第一个参数算法类型就不多说了
    var hmacSha256 = Hmac(sha256, key); // HMAC-SHA256
    var digest = hmacSha256.convert(bytes);
    final encryptStr = digest.toString();
    print("SHA256的HMAC加密后文本：key:$hmacKey value:$encryptStr");
  }





}
