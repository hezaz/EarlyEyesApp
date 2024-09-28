// To parse this JSON data, do
//
//     final changePasswordResModel = changePasswordResModelFromJson(jsonString);

import 'dart:convert';

ChangePasswordResModel changePasswordResModelFromJson(String str) => ChangePasswordResModel.fromJson(json.decode(str));

String changePasswordResModelToJson(ChangePasswordResModel data) => json.encode(data.toJson());

class ChangePasswordResModel {
  final bool success;
  final String? message;
  final ChangePassword? data;

  ChangePasswordResModel({
    required this.success,
    this.message,
    this.data,
  });

  factory ChangePasswordResModel.fromJson(Map<String, dynamic> json) => ChangePasswordResModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : ChangePassword.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data?.toJson(),
  };
}

class ChangePassword {
  final int? id;
  final int? roleId;
  final dynamic parentId;
  final String? fullName;
  final String? email;
  final String? mobileNumber;
  final int? isActive;
  final String? token;
  final dynamic lastLoggedIn;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ChangePassword({
    this.id,
    this.roleId,
    this.parentId,
    this.fullName,
    this.email,
    this.mobileNumber,
    this.isActive,
    this.token,
    this.lastLoggedIn,
    this.createdAt,
    this.updatedAt,
  });

  factory ChangePassword.fromJson(Map<String, dynamic> json) => ChangePassword(
    id: json["id"],
    roleId: json["role_id"],
    parentId: json["parent_id"],
    fullName: json["full_name"],
    email: json["email"],
    mobileNumber: json["mobile_number"],
    isActive: json["is_active"],
    token: json["token"],
    lastLoggedIn: json["last_logged_in"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "role_id": roleId,
    "parent_id": parentId,
    "full_name": fullName,
    "email": email,
    "mobile_number": mobileNumber,
    "is_active": isActive,
    "token": token,
    "last_logged_in": lastLoggedIn,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
