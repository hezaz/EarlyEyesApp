// To parse this JSON data, do
//
//     final parentUpdateResModel = parentUpdateResModelFromJson(jsonString);

import 'dart:convert';

import 'package:early_eyes/feature/data/models/requestModels/profile_res_model.dart';
import 'package:early_eyes/feature/data/models/requestModels/user_data.dart';

ParentUpdateResModel parentUpdateResModelFromJson(String str) => ParentUpdateResModel.fromJson(json.decode(str));

String parentUpdateResModelToJson(ParentUpdateResModel data) => json.encode(data.toJson());

class ParentUpdateResModel {
  final bool success;
  final String? message;
  final UserData? data;

  ParentUpdateResModel({
    required this.success,
    this.message,
    this.data,
  });

  factory ParentUpdateResModel.fromJson(Map<String, dynamic> json) => ParentUpdateResModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : UserData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data?.toJson(),
  };
}


