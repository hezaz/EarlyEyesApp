// To parse this JSON data, do
//
//     final coursesResModel = coursesResModelFromJson(jsonString);

import 'dart:convert';

CoursesResModel coursesResModelFromJson(String str) => CoursesResModel.fromJson(json.decode(str));

String coursesResModelToJson(CoursesResModel data) => json.encode(data.toJson());

class CoursesResModel {
  final bool success;
  final String? message;
  final List<Courses>? data;

  CoursesResModel({
    required this.success,
    this.message,
    this.data,
  });

  factory CoursesResModel.fromJson(Map<String, dynamic> json) => CoursesResModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Courses>.from(json["data"]!.map((x) => Courses.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Courses {
  final int? id;
  final String? courseTitle;
  final String? courseCategory;
  final String? courseDuration;
  final String? courseLevel;
  final String? price;
  final int? enrollmentLimit;
  final String? courseDescription;
  final int? instructorAssignment;
  final String? courseThumbnails;
  final dynamic courseMaterials;
  final DateTime? courseDate;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Instructor? instructor;

  Courses({
    this.id,
    this.courseTitle,
    this.courseCategory,
    this.courseDuration,
    this.courseLevel,
    this.price,
    this.enrollmentLimit,
    this.courseDescription,
    this.instructorAssignment,
    this.courseThumbnails,
    this.courseMaterials,
    this.courseDate,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.instructor,
  });

  factory Courses.fromJson(Map<String, dynamic> json) => Courses(
    id: json["id"],
    courseTitle: json["course_title"],
    courseCategory: json["course_category"],
    courseDuration: json["course_duration"],
    courseLevel: json["course_level"],
    price: json["price"],
    enrollmentLimit: json["enrollment_limit"],
    courseDescription: json["course_description"],
    instructorAssignment: json["instructor_assignment"],
    courseThumbnails: json["course_thumbnails"],
    courseMaterials: json["course_materials"],
    courseDate: json["course_date"] == null ? null : DateTime.parse(json["course_date"]),
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    instructor: json["instructor"] == null ? null : Instructor.fromJson(json["instructor"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "course_title": courseTitle,
    "course_category": courseCategory,
    "course_duration": courseDuration,
    "course_level": courseLevel,
    "price": price,
    "enrollment_limit": enrollmentLimit,
    "course_description": courseDescription,
    "instructor_assignment": instructorAssignment,
    "course_thumbnails": courseThumbnails,
    "course_materials": courseMaterials,
    "course_date": "${courseDate!.year.toString().padLeft(4, '0')}-${courseDate!.month.toString().padLeft(2, '0')}-${courseDate!.day.toString().padLeft(2, '0')}",
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "instructor": instructor?.toJson(),
  };
}

class Instructor {
  final int? id;
  final int? roleId;
  final dynamic parentId;
  final String? fullName;
  final String? email;
  final String? mobileNumber;
  final int? isActive;
  final dynamic token;
  final DateTime? lastLoggedIn;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Instructor({
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

  factory Instructor.fromJson(Map<String, dynamic> json) => Instructor(
    id: json["id"],
    roleId: json["role_id"],
    parentId: json["parent_id"],
    fullName: json["full_name"],
    email: json["email"],
    mobileNumber: json["mobile_number"],
    isActive: json["is_active"],
    token: json["token"],
    lastLoggedIn: json["last_logged_in"] == null ? null : DateTime.parse(json["last_logged_in"]),
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
    "last_logged_in": lastLoggedIn?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
