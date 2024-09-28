// To parse this JSON data, do
//
//     final childResModelModel = childResModelModelFromJson(jsonString);

import 'dart:convert';

ChildResModelModel childResModelModelFromJson(String str) => ChildResModelModel.fromJson(json.decode(str));

String childResModelModelToJson(ChildResModelModel data) => json.encode(data.toJson());

class ChildResModelModel {
  final bool success;
  final String? message;
  final List<ChildData>? data;

  ChildResModelModel({
    required this.success,
    this.message,
    this.data,
  });

  factory ChildResModelModel.fromJson(Map<String, dynamic> json) => ChildResModelModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<ChildData>.from(json["data"]!.map((x) => ChildData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class ChildData {
  final int? id;
  final int? roleId;
  final int? parentId;
  final String? fullName;
  final String? email;
  final dynamic mobileNumber;
  final int? isActive;
  final dynamic token;
  final dynamic lastLoggedIn;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final GetChild? userDetails;

  ChildData({
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

  factory ChildData.fromJson(Map<String, dynamic> json) => ChildData(
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
    userDetails: json["user_details"] == null ? null : GetChild.fromJson(json["user_details"]),
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

class GetChild {
  final int? id;
  final int? userId;
  final String? gender;
  final DateTime? dob;
  final String? userDetailsClass;
  final dynamic studentEmail;
  final String? mailingAddress;
  final String? experience;
  final String? comment;
  final dynamic profilePic;
  final dynamic tutorEmail;
  final dynamic schoolName;
  final dynamic courseId;
  final dynamic courseName;
  final dynamic courseSchedule;
  final dynamic relationship;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  GetChild({
    this.id,
    this.userId,
    this.gender,
    this.dob,
    this.userDetailsClass,
    this.studentEmail,
    this.mailingAddress,
    this.experience,
    this.comment,
    this.profilePic,
    this.tutorEmail,
    this.schoolName,
    this.courseId,
    this.courseName,
    this.courseSchedule,
    this.relationship,
    this.createdAt,
    this.updatedAt,
  });

  factory GetChild.fromJson(Map<String, dynamic> json) => GetChild(
    id: json["id"],
    userId: json["user_id"],
    gender: json["gender"],
    dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
    userDetailsClass: json["class"],
    studentEmail: json["student_email"],
    mailingAddress: json["mailing_address"],
    experience: json["experience"],
    comment: json["comment"],
    profilePic: json["profile_pic"],
    tutorEmail: json["tutor_email"],
    schoolName: json["school_name"],
    courseId: json["course_id"],
    courseName: json["course_name"],
    courseSchedule: json["course_schedule"],
    relationship: json["relationship"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "gender": gender,
    "dob": "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
    "class": userDetailsClass,
    "student_email": studentEmail,
    "mailing_address": mailingAddress,
    "experience": experience,
    "comment": comment,
    "profile_pic": profilePic,
    "tutor_email": tutorEmail,
    "school_name": schoolName,
    "course_id": courseId,
    "course_name": courseName,
    "course_schedule": courseSchedule,
    "relationship": relationship,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
