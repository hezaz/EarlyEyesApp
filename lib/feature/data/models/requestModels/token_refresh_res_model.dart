// To parse this JSON data, do
//
//     final tokenRefreshResModel = tokenRefreshResModelFromJson(jsonString);

import 'dart:convert';

TokenRefreshResModel tokenRefreshResModelFromJson(String str) => TokenRefreshResModel.fromJson(json.decode(str));

String tokenRefreshResModelToJson(TokenRefreshResModel data) => json.encode(data.toJson());

class TokenRefreshResModel {
  final bool success;
  final String? token;

  TokenRefreshResModel({
    required this.success,
    this.token,
  });

  factory TokenRefreshResModel.fromJson(Map<String, dynamic> json) => TokenRefreshResModel(
    success: json["success"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "token": token,
  };
}
