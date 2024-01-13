// To parse this JSON data, do
//
//     final apiLoginResult = apiLoginResultFromJson(jsonString);

import 'dart:convert';

ApiAuthResult apiLoginResultFromJson(String str) => ApiAuthResult.fromJson(json.decode(str));

String apiLoginResultToJson(ApiAuthResult data) => json.encode(data.toJson());

class ApiAuthResult {
  final String? message;
  final UserData? data;
  final bool? status;
  final int? code;

  ApiAuthResult({
    this.message,
    this.data,
    this.status,
    this.code,
  });

  factory ApiAuthResult.fromJson(Map<String, dynamic> json) => ApiAuthResult(
    message: json["message"],
    data: json["data"] == null ? null : UserData.fromJson(json["data"]),
    status: json["status"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data?.toJson(),
    "status": status,
    "code": code,
  };
}

class UserData {
  final String? token;
  final String? username;

  UserData({
    this.token,
    this.username,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    token: json["token"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "username": username,
  };
}
