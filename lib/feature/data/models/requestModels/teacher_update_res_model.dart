// To parse this JSON data, do
//
//     final teacherUpdateResModel = teacherUpdateResModelFromJson(jsonString);

import 'dart:convert';

import 'package:early_eyes/feature/data/models/requestModels/profile_res_model.dart';
import 'package:early_eyes/feature/data/models/requestModels/user_data.dart';

TeacherUpdateResModel teacherUpdateResModelFromJson(String str) => TeacherUpdateResModel.fromJson(json.decode(str));

String teacherUpdateResModelToJson(TeacherUpdateResModel data) => json.encode(data.toJson());

class TeacherUpdateResModel {
  final bool success;
  final String? message;
  final UserData? data;

  TeacherUpdateResModel({
    required this.success,
    this.message,
    this.data,
  });

  factory TeacherUpdateResModel.fromJson(Map<String, dynamic> json) => TeacherUpdateResModel(
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


