// To parse this JSON data, do
//
//     final deleteChildResModel = deleteChildResModelFromJson(jsonString);

import 'dart:convert';

DeleteChildResModel deleteChildResModelFromJson(String str) => DeleteChildResModel.fromJson(json.decode(str));

String deleteChildResModelToJson(DeleteChildResModel data) => json.encode(data.toJson());

class DeleteChildResModel {
  final bool? success;
  final String? message;

  DeleteChildResModel({
    this.success,
    this.message,
  });

  factory DeleteChildResModel.fromJson(Map<String, dynamic> json) => DeleteChildResModel(
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
