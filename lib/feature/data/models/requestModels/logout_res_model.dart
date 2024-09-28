// To parse this JSON data, do
//
//     final logoutResModel = logoutResModelFromJson(jsonString);

import 'dart:convert';

LogoutResModel logoutResModelFromJson(String str) => LogoutResModel.fromJson(json.decode(str));

String logoutResModelToJson(LogoutResModel data) => json.encode(data.toJson());

class LogoutResModel {
  final bool success;
  final String? message;

  LogoutResModel({
    required this.success,
    this.message,
  });

  factory LogoutResModel.fromJson(Map<String, dynamic> json) => LogoutResModel(
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
