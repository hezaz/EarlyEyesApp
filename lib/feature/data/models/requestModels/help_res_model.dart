// To parse this JSON data, do
//
//     final helpResModel = helpResModelFromJson(jsonString);

import 'dart:convert';

HelpResModel helpResModelFromJson(String str) => HelpResModel.fromJson(json.decode(str));

String helpResModelToJson(HelpResModel data) => json.encode(data.toJson());

class HelpResModel {
  final bool success;
  final String? message;

  HelpResModel({
    required this.success,
    this.message,
  });

  factory HelpResModel.fromJson(Map<String, dynamic> json) => HelpResModel(
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
