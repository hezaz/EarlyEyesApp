// To parse this JSON data, do
//
//     final forgotPasswordResModel = forgotPasswordResModelFromJson(jsonString);

import 'dart:convert';

ForgotPasswordResModel forgotPasswordResModelFromJson(String str) => ForgotPasswordResModel.fromJson(json.decode(str));

String forgotPasswordResModelToJson(ForgotPasswordResModel data) => json.encode(data.toJson());

class ForgotPasswordResModel {
  final bool success;
  final String? message;
  final String? data;

  ForgotPasswordResModel({
    required this.success,
    this.message,
    this.data,
  });

  factory ForgotPasswordResModel.fromJson(Map<String, dynamic> json) => ForgotPasswordResModel(
    success: json["success"],
    message: json["message"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data,
  };
}
