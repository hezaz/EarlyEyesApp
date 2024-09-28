// To parse this JSON data, do
//
//     final deleteAccResModel = deleteAccResModelFromJson(jsonString);

import 'dart:convert';

DeleteAccResModel deleteAccResModelFromJson(String str) => DeleteAccResModel.fromJson(json.decode(str));

String deleteAccResModelToJson(DeleteAccResModel data) => json.encode(data.toJson());

class DeleteAccResModel {
  final bool success;
  final String? message;
  final List<dynamic>? data;

  DeleteAccResModel({
    required this.success,
    this.message,
    this.data,
  });

  factory DeleteAccResModel.fromJson(Map<String, dynamic> json) => DeleteAccResModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<dynamic>.from(json["data"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
  };
}
