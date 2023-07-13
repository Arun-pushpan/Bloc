// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.jwtAccessToken,
    required this.jwtRefreshToken,
    required this.usersId,
  });

  String jwtAccessToken;
  String jwtRefreshToken;
  String usersId;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    jwtAccessToken: json["jwtAccessToken"],
    jwtRefreshToken: json["jwtRefreshToken"],
    usersId: json["usersId"],
  );

  Map<String, dynamic> toJson() => {
    "jwtAccessToken": jwtAccessToken,
    "jwtRefreshToken": jwtRefreshToken,
    "usersId": usersId,
  };
}
