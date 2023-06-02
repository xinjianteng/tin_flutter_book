
// 登录请求
class UserCsgLoginRequestEntity {
  String username;
  String password;

  UserCsgLoginRequestEntity({
    required this.username,
    required this.password,
  });

  factory UserCsgLoginRequestEntity.fromJson(Map<String, dynamic> json) =>
      UserCsgLoginRequestEntity(
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}

// 登录返回
class UserCsgLoginResponseEntity {
  String? objectId;
  String? createdAt;
  String? sessionToken;
  String? updatedAt;
  String? username;

  UserCsgLoginResponseEntity({
    this.objectId,
    this.createdAt,
    this.sessionToken,
    this.updatedAt,
    this.username,
  });

  factory UserCsgLoginResponseEntity.fromJson(Map<String, dynamic> json) =>
      UserCsgLoginResponseEntity(
        objectId: json["objectId"],
        createdAt: json["createdAt"],
        sessionToken: json["sessionToken"],
        updatedAt: json["updatedAt"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "objectId": objectId,
        "createdAt": createdAt,
        "sessionToken": sessionToken,
        "updatedAt": updatedAt,
        "username": username,
      };
}

