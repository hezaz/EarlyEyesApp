// To parse this JSON data, do
//
//     final profileResModel = profileResModelFromJson(jsonString);

import 'dart:convert';

import 'student_profile_res_model.dart';

ProfileResModel profileResModelFromJson(String str) => ProfileResModel.fromJson(json.decode(str));

String profileResModelToJson(ProfileResModel data) => json.encode(data.toJson());

class ProfileResModel {
  final bool success;
  final String? message;
  final UserData? getProfile;

  ProfileResModel({
    required this.success,
    this.message,
    this.getProfile,
  });

  factory ProfileResModel.fromJson(Map<String, dynamic> json) => ProfileResModel(
    success: json["success"],
    message: json["message"],
    getProfile: json["data"] == null ? null : UserData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": getProfile?.toJson(),
  };
}

class UserData {
  final dynamic id;
  final String? roleId;
  final dynamic parentId;
  final String? fullName;
  final String? email;
  final dynamic mobileNumber;
  final String? isActive;
  final String? token;
  final dynamic lastLoggedIn;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final UserDetails? userDetails;

  UserData({
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
    this.userDetails,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
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
    userDetails: json["user_details"] == null ? null : UserDetails.fromJson(json["user_details"]),
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
    "user_details": userDetails?.toJson(),
  };
}
