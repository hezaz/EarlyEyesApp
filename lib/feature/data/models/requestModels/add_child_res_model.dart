// To parse this JSON data, do
//
//     final addChildResModel = addChildResModelFromJson(jsonString);

import 'dart:convert';

AddChildResModel addChildResModelFromJson(String str) => AddChildResModel.fromJson(json.decode(str));

String addChildResModelToJson(AddChildResModel data) => json.encode(data.toJson());

class AddChildResModel {
  final bool success;
  final String? message;
  final AddChild? addChild;

  AddChildResModel({
    required this.success,
    this.message,
    this.addChild,
  });

  factory AddChildResModel.fromJson(Map<String, dynamic> json) => AddChildResModel(
    success: json["success"],
    message: json["message"],
    addChild: json["data"] == null ? null : AddChild.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": addChild?.toJson(),
  };
}

class AddChild {
  final int? roleId;
  final String? fullName;
  final String? email;
  final bool? isActive;
  final String? parentId;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;
  final ChildDetails? userDetails;

  AddChild({
    this.roleId,
    this.fullName,
    this.email,
    this.isActive,
    this.parentId,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.userDetails,
  });

  factory AddChild.fromJson(Map<String, dynamic> json) => AddChild(
    roleId: json["role_id"],
    fullName: json["full_name"],
    email: json["email"],
    isActive: json["is_active"],
    parentId: json["parent_id"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    id: json["id"],
    userDetails: json["user_details"] == null ? null : ChildDetails.fromJson(json["user_details"]),
  );

  Map<String, dynamic> toJson() => {
    "role_id": roleId,
    "full_name": fullName,
    "email": email,
    "is_active": isActive,
    "parent_id": parentId,
    "updated_at": updatedAt?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
    "id": id,
    "user_details": userDetails?.toJson(),
  };
}

class ChildDetails {
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

  ChildDetails({
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

  factory ChildDetails.fromJson(Map<String, dynamic> json) => ChildDetails(
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
